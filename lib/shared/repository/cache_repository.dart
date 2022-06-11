import 'package:hive_flutter/hive_flutter.dart';
import 'package:rickandmorty/shared/models/index.dart';

class CacheRepository {
        static const int characterTypeId = 0;
        static const int characterLocationTypeId = 1;
        static const int paginationModelTypeId = 2;
        static const int paginationModelInfoTypeId = 3;

        final String boxName = "PaginationModelCacheBox";
        late Box<PaginationModel> box;

        CacheRepository(){
                Hive.initFlutter().then((value) { 
                        Hive.registerAdapter(PaginationModelAdapter());
                        Hive.registerAdapter(PaginationModelInfoAdapter());
                        Hive.registerAdapter(CharacterAdapter());
                        Hive.registerAdapter(CharacterLocationAdapter());
                        
                        Hive.openBox<PaginationModel>(boxName).then((boxOppened){
                                box = boxOppened;
                        });
                });
        }

        saveQueryCache(String query, PaginationModel paginationModel){
               box.put(query, paginationModel);
        }

        PaginationModel? getQueryCache(String id){
                if(box.containsKey(id)){
                        return box.get(id)!;
                }
               return null;
        }
}
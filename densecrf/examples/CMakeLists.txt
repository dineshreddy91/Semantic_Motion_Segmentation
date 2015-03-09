add_executable( dense_inference util.cpp dense_inference.cpp )
target_link_libraries( dense_inference densecrf )
add_executable( dense_inference_old util.cpp dense_inference_old.cpp )
target_link_libraries( dense_inference_old densecrf )

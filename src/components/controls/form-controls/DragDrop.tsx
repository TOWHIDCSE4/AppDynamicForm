import { FC } from "react";
import { Upload } from "antd";
import { Controller } from "react-hook-form";
import { AiOutlineCloudUpload } from "react-icons/ai";
const { Dragger } = Upload;
interface DragDropProps {
  control: any;
  name: string;
  errors?: any;
  msg?: string;
  fileType?: string;
  acceptFileFormat?: any;
  fileTypeLabelText?: string;
  fileSizeLabelText?: string;
  onRemoveFile: () => void;
  beforeUpload?: () => void;
}

export const DragDrop: FC<DragDropProps> = ({
  control,
  name,
  errors,
  msg,
  fileType = "file",
  acceptFileFormat,
  fileTypeLabelText,
  fileSizeLabelText,
  onRemoveFile,
  beforeUpload,
}) => {
  let errMsg = msg ? msg : errors?.[name]?.message;
  return (
    <div>
      <Controller
        control={control}
        name={name}
        render={({ field }) => (
          <Dragger
            {...field}
            beforeUpload={() => {
              beforeUpload && beforeUpload();
              return false;
            }}
            multiple={false}
            accept={acceptFileFormat}
            maxCount={1}
            onRemove={(file) => {
              onRemoveFile();
            }}
            // style={{padding:"20px 0px"}}
          >
            <div className="flex justify-center mt-1">
              <AiOutlineCloudUpload className="text-3xl text-sky-600" />
            </div>
            <p className="text-sky-800 pt-2 text-xs font-medium">Click or drag {fileType} to this area to upload.</p>
            {fileTypeLabelText && <p className="text-xs text-gray-500 pt-2">{fileTypeLabelText}</p>}{" "}
            {fileSizeLabelText && <p className="text-xs text-gray-500 pt-2">{fileSizeLabelText}</p>}
          </Dragger>
        )}
      />
      <p className="error-msg mt-1">{errMsg}</p>
    </div>
  );
};

import React, { useState } from "react";
import { useForm, FormProvider } from "react-hook-form";
import { CommonForm } from "./CommonForm";
import schemaData from "../../../../config/Application_schema.json";
import useBaseHook from "@src/hooks/BaseHook";
import { Button, Row, Col } from "antd";
import to from "await-to-js";
import documentTemplateService from "@root/src/services/documentTemplateService";
import { values } from "lodash";

const DynamicFormPage = () => {
  const { t, notify } = useBaseHook();

  const [formJsonSchema, setFormJsonSchema] = useState(schemaData);
  const [loading, setLoading] = useState(false);

  const methods = useForm({
    mode: "all",
  });

  const { handleSubmit } = methods;

  const onSubmit = async (data: any) => {
    setLoading(true);
    const reqBody = {
      name: "Staff Insurance FormStaff Insurance 2022",
      description: null,
      content: JSON.stringify(data),
      locale: null,
      createdBy: null,
      updatedBy: null,
    };

    let [error, result]: any[] = await to(
      documentTemplateService().create(reqBody)
    );
    setLoading(false);
    if (error) return notify(t(`errors:${error.code}`), "", "error");
    notify(t("messages:message.staffInsuranceFormSuccess"));
    return result;
  };
 
  return (
    <div className="common-form-container">
      <FormProvider {...methods}>
        <form onSubmit={handleSubmit(onSubmit)}>
          {Object.values(formJsonSchema).map(
            (fieldValue, i) => {
              //  fieldValue group = new group (fieldValue?.groupTitle=="Personal details");
              return (
                <div key={i}>
                  <fieldset className="fieldset">
                    <legend >{fieldValue?.groupTitle}</legend>
                    {/* <h2>{fieldValue?.title}</h2> */}
                    <Row className="field-container-one-third">
                      {formJsonSchema.map((field, k) => {
                        return (
                          <Col
                            key={k}
                            xs="field.Col.xs"
                            lg="field.Col.lg"
                            order={field.position}
                          >
                            <CommonForm
                              formField={field}
                            />
                          </Col>
                        );
                      })}
                    </Row>
                  </fieldset>
                </div>
              );
            }
          )}

          <div className="">
            <Button
              type="primary"
              size="large"
              htmlType="submit"
              className=""
            >
              Submit
            </Button>
          </div>
        </form>
      </FormProvider>
    </div>
  );
};

export default DynamicFormPage;
function notify(arg0: any, arg1: string, arg2: string) {
  throw new Error("Function not implemented.");
}

function redirect(arg0: string) {
  throw new Error("Function not implemented.");
}

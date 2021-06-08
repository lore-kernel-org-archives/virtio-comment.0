Return-Path: virtio-comment-return-1891-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 233CD986586
	for <virtio-comment@lists.oasis-open.org>; Tue,  8 Jun 2021 11:32:31 +0000 (UTC)
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Tue,  8 Jun 2021 17:02:24 +0530
Message-Id: <111a00fa282a181c391f5566fd674dc59abb55b5.1623151932.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [virtio-comment] [PATCH V3] virtio-gpio: Add the device specification
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="US-ASCII"
To: virtio-comment@lists.oasis-open.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Jason Wang <jasowang@redhat.com>
List-ID: <virtio-comment.lists.oasis-open.org>

virtio-gpio is a virtual GPIO controller. It provides a way to flexibly
communicate with the host GPIO controllers from the guest.

This patch adds the specification for it.

Based on the initial work done by:
"Enrico Weigelt, metux IT consult" <lkml@metux.net>.

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/110
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
V2 -> V3:
- Unused char in name string should be marked 0 now.
- s/host/device/ and s/guest/driver/
- Added a new feature for IRQ mode, VIRTIO_GPIO_F_IRQ.
- A new feature should be added for Version information if required
  later on.

V1 -> V2:
- gpio_names_size is 32 bit.
- gpio field is 16 bit.
- padding added 16 bit.
- Added packed attribute to few structures
- Add the missing 'type' field to the request
- Dropped to _nodata request/responses to simplify a bit, updated
  related text.
---
 conformance.tex |  26 ++++-
 content.tex     |   1 +
 virtio-gpio.tex | 287 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 310 insertions(+), 4 deletions(-)
 create mode 100644 virtio-gpio.tex

diff --git a/conformance.tex b/conformance.tex
index a164cbb69093..5341abe096c2 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -29,8 +29,9 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}
 \ref{sec:Conformance / Driver Conformance / IOMMU Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Sound Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance=
} or
-\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance=
},
+\ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance}.
=20
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Dev=
ice and Transitional Driver Conformance}.
   \end{itemize}
@@ -52,8 +53,9 @@ \section{Conformance Targets}\label{sec:Conformance / Con=
formance Targets}
 \ref{sec:Conformance / Device Conformance / IOMMU Device Conformance},
 \ref{sec:Conformance / Device Conformance / Sound Device Conformance},
 \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
-\ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance=
} or
-\ref{sec:Conformance / Device Conformance / SCMI Device Conformance}.
+\ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance=
},
+\ref{sec:Conformance / Device Conformance / SCMI Device Conformance} or
+\ref{sec:Conformance / Device Conformance / GPIO Device Conformance}.
=20
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Dev=
ice and Transitional Driver Conformance}.
   \end{itemize}
@@ -288,6 +290,14 @@ \section{Conformance Targets}\label{sec:Conformance / =
Conformance Targets}
 \item \ref{drivernormative:Device Types / SCMI Device / Device Operation /=
 Setting Up eventq Buffers}
 \end{itemize}
=20
+\conformance{\subsection}{GPIO Driver Conformance}\label{sec:Conformance /=
 Driver Conformance / GPIO Driver Conformance}
+
+An GPIO driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / GPIO Device / Device Operation}
+\end{itemize}
+
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device =
Conformance}
=20
 A device MUST conform to the following normative statements:
@@ -527,6 +537,14 @@ \section{Conformance Targets}\label{sec:Conformance / =
Conformance Targets}
 \item \ref{devicenormative:Device Types / SCMI Device / Device Operation /=
 Shared Memory Operation}
 \end{itemize}
=20
+\conformance{\subsection}{GPIO Device Conformance}\label{sec:Conformance /=
 Device Conformance / GPIO Device Conformance}
+
+An GPIO device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / GPIO Device / Device Operation}
+\end{itemize}
+
 \conformance{\section}{Legacy Interface: Transitional Device and Transitio=
nal Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitio=
nal Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
 non-transitional, see \ref{intro:Legacy
diff --git a/content.tex b/content.tex
index d9913d056317..e572ac3bb6c0 100644
--- a/content.tex
+++ b/content.tex
@@ -6583,6 +6583,7 @@ \subsubsection{Legacy Interface: Framing Requirements=
}\label{sec:Device
 \input{virtio-mem.tex}
 \input{virtio-i2c.tex}
 \input{virtio-scmi.tex}
+\input{virtio-gpio.tex}
=20
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
=20
diff --git a/virtio-gpio.tex b/virtio-gpio.tex
new file mode 100644
index 000000000000..5ac17764c2e4
--- /dev/null
+++ b/virtio-gpio.tex
@@ -0,0 +1,287 @@
+\section{GPIO Device}\label{sec:Device Types / GPIO Device}
+
+virtio-gpio is a virtual general purpose IO controller device. It provides=
 a way
+to access the host GPIO devices from the guest. This device provides a har=
dware
+independent interface between the host and the guests. It allows the host =
to
+club together GPIO lines from otherwise independent GPIO controllers and p=
resent
+them as a single GPIO controller device at the guest.
+
+\subsection{Device ID}\label{sec:Device Types / GPIO Device / Device ID}
+41
+
+\subsection{Virtqueues}\label{sec:Device Types / GPIO Device / Virtqueues}
+
+\begin{description}
+\item[0] command
+\item[1] interrupt
+\end{description}
+
+The \field{interrupt} virtqueue is only used if the \field{VIRTIO_GPIO_F_I=
RQ}
+feature is supported by the device.
+
+\subsection{Feature bits}\label{sec:Device Types / GPIO Device / Feature b=
its}
+
+\begin{description}
+\item[VIRTIO_GPIO_F_IRQ (0)] The device supports interrupts on GPIO lines.
+\end{description}
+
+
+\subsection{Device configuration layout}\label{sec:Device Types / GPIO Dev=
ice / Device configuration layout}
+
+All fields of this configuration are always available and are read-only fo=
r the driver.
+
+\begin{lstlisting}
+struct virtio_gpio_config {
+    char name[32];
+    u16 ngpio;
+    u16 padding;
+    u32 gpio_names_size;
+    char gpio_names[0];
+} __attribute__((packed));
+\end{lstlisting}
+
+\begin{description}
+\item[\field{name}] is a null-terminated string that represents the name o=
f the
+    GPIO controller. The unused characters in the string must be initializ=
ed to
+    zero by the device.
+\item[\field{ngpio}] is the total number of GPIO lines provided by the
+    controller.
+\item[\field{gpio_names_size}] is the size of the \field{gpio_names} strin=
g.
+    This field must be set to 0, if the \field(gpio_names) is not used.
+\item[\field{gpio_names}] is a stream of \field{ngpio} null-terminated str=
ings,
+    where each string corresponds to a GPIO line.
+\end{description}
+
+
+\subsection{Device Initialization}\label{sec:Device Types / GPIO Device / =
Device Initialization}
+
+\begin{enumerate}
+\item The virtqueue is initialized.
+\end{enumerate}
+
+\subsection{Device Operation}\label{sec:Device Types / GPIO Device / Devic=
e Operation}
+
+The operations of a virtio GPIO device are almost always driven by the dri=
ver.
+The driver initiates one of the requests from \field{VIRTIO_GPIO_REQ_*} on=
 the
+\field{command} virtqueue and the device responds synchronously on the sam=
e
+virtqueue with a response message. The only time a request is initiated by=
 the
+device is when it needs to report detection of an interrupt on a GPIO line=
 and
+the \field{VIRTIO_GPIO_F_IRQ} feature is supported by the device. This is =
done
+by the device by sending the (\field{VIRTIO_GPIO_IRQ_EVENT}) request on th=
e
+\field{interrupt} virtqueue.
+
+\begin{lstlisting}
+/* GPIO request types */
+#define VIRTIO_GPIO_REQ_ACTIVATE                0x01
+#define VIRTIO_GPIO_REQ_DEACTIVATE              0x02
+#define VIRTIO_GPIO_REQ_GET_DIRECTION           0x03
+#define VIRTIO_GPIO_REQ_DIRECTION_IN            0x04
+#define VIRTIO_GPIO_REQ_DIRECTION_OUT           0x05
+#define VIRTIO_GPIO_REQ_GET_VALUE               0x06
+#define VIRTIO_GPIO_REQ_SET_VALUE               0x07
+#define VIRTIO_GPIO_REQ_IRQ_TYPE                0x08
+#define VIRTIO_GPIO_REQ_IRQ_MASK                0x09
+#define VIRTIO_GPIO_REQ_IRQ_UNMASK              0x0a
+#define VIRTIO_GPIO_IRQ_EVENT                   0x0b
+\end{lstlisting}
+
+\subsubsection{Device Operation: Request Queue}\label{sec:Device Types / G=
PIO Device / Device Operation: Request Queue}
+
+The communication between the device and the driver take place using a pai=
r of
+request and response messages. The virtio GPIO specification defines two r=
equest
+and two response layouts. The particular request/response pair used for ea=
ch
+GPIO request type is specific later in the request specific sections.
+
+Supported request and response types:
+
+\begin{lstlisting}
+/* Virtio GPIO Request */
+struct virtio_gpio_request {
+        u16 type;
+        u16 gpio;
+        u8 data;
+} __attribute__((packed));
+
+/* Virtio GPIO Response */
+struct virtio_gpio_response {
+        u8 status;
+        u8 data;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{type}] GPIO request type.
+\item[\field{gpio}] GPIO line number.
+\item[\field{data}] Request/Response specific data, not used by all
+=09request/response messages.
+\item[\field{status}] Status of the request, success or failure.
+\end{description}
+
+Here is the list of different values these fields can contain based on the
+specific request type.
+
+\begin{lstlisting}
+/* GPIO line direction */
+#define VIRTIO_GPIO_DIRECTION_OUT               0x0
+#define VIRTIO_GPIO_DIRECTION_IN                0x1
+
+/* GPIO line interrupt type */
+#define VIRTIO_GPIO_IRQ_TYPE_NONE               0x00
+#define VIRTIO_GPIO_IRQ_TYPE_EDGE_RISING        0x01
+#define VIRTIO_GPIO_IRQ_TYPE_EDGE_FALLING       0x02
+#define VIRTIO_GPIO_IRQ_TYPE_EDGE_BOTH          0x03
+#define VIRTIO_GPIO_IRQ_TYPE_LEVEL_HIGH         0x04
+#define VIRTIO_GPIO_IRQ_TYPE_LEVEL_LOW          0x08
+
+/* Possible values of the status field */
+#define VIRTIO_GPIO_STATUS_OK                   0x0
+#define VIRTIO_GPIO_STATUS_ERR                  0x1
+\end{lstlisting}
+
+\subsubsection{Device Operation: Activate}\label{sec:Device Types / GPIO D=
evice / Device Operation / Activate }
+
+The \field{VIRTIO_GPIO_REQ_ACTIVATE} request is initiated by the driver to
+request the device to activate one of the GPIO lines for use. The driver s=
ends
+the \field{struct virtio_gpio_request} to the device, and the device respo=
nds
+with \field{struct virtio_gpio_response}. Neither the request, nor the res=
ponse
+uses the \field{data} field.
+
+\subsubsection{Device Operation: Deactivate}\label{sec:Device Types / GPIO=
 Device / Device Operation / Deactivate }
+
+The \field{VIRTIO_GPIO_REQ_DEACTIVATE} request is initiated by the driver =
to
+request the device to deactivate one of the GPIO lines driver was previous=
ly
+using.  The driver sends the \field{struct virtio_gpio_request} to the dev=
ice,
+and the device responds with \field{struct virtio_gpio_response}. Neither =
the
+request, nor the response uses the \field{data} field.
+
+\subsubsection{Device Operation: Get Direction}\label{sec:Device Types / G=
PIO Device / Device Operation / Get Direction }
+
+The \field{VIRTIO_GPIO_REQ_GET_DIRECTION} request is initiated by the driv=
er to
+request the device to return a GPIO line's configured direction. The drive=
r
+sends the \field{struct virtio_gpio_request} to the device, and the device
+responds with \field{struct virtio_gpio_response}. The device shall set th=
e
+\field{data} field in the response to \field{VIRTIO_GPIO_DIRECTION_OUT} or
+\field{VIRTIO_GPIO_DIRECTION_IN}. The request doesn't use the \field{data}
+field.
+
+\subsubsection{Device Operation: Direction In}\label{sec:Device Types / GP=
IO Device / Device Operation / Direction In }
+
+The \field{VIRTIO_GPIO_REQ_DIRECTION_IN} request is initiated by the drive=
r to
+request the device to configure a GPIO line for input direction. The drive=
r
+sends the \field{struct virtio_gpio_request} to the device, and the device
+responds with \field{struct virtio_gpio_response}. Neither the request, no=
r the
+response uses the \field{data} field.
+
+\subsubsection{Device Operation: Direction Out}\label{sec:Device Types / G=
PIO Device / Device Operation / Direction Out }
+
+The \field{VIRTIO_GPIO_REQ_DIRECTION_OUT} request is initiated by the driv=
er to
+request the device to configure a GPIO line for output direction with an i=
nitial
+output value (0 for low, 1 for high). The driver sends the \field{struct
+virtio_gpio_request} to the device with initial output value set in the
+\field{data} field, and the device responds with \field{struct
+virtio_gpio_response}. The responds doesn't use the \field{data} field.
+
+\subsubsection{Device Operation: Get Value}\label{sec:Device Types / GPIO =
Device / Device Operation / Get Value }
+
+The \field{VIRTIO_GPIO_REQ_GET_VALUE} request is initiated by the driver t=
o
+request the device to return the current value sensed on a GPIO line (0 fo=
r low,
+1 for high) configured for input. The driver sends the \field{struct
+virtio_gpio_request} to the device, and the device responds responds with
+\field{struct virtio_gpio_response} with its \field{data} field set to GPI=
O's
+value. The request doesn't use the \field{data} field.
+
+\subsubsection{Device Operation: Set Value}\label{sec:Device Types / GPIO =
Device / Device Operation / Set Value }
+
+The \field{VIRTIO_GPIO_REQ_SET_VALUE} request is initiated by the driver t=
o
+request the device to set the value (0 for low, 1 for high) for a GPIO lin=
e
+configured for output. The driver sends the \field{struct virtio_gpio_requ=
est}
+to the device, with the output value set in the \field{data} field, and th=
e
+device responds with \field{struct virtio_gpio_response}. The responds doe=
sn't
+use the \field{data} field.
+
+\subsubsection{Device Operation: IRQ Type}\label{sec:Device Types / GPIO D=
evice / Device Operation / IRQ Type }
+
+The \field{VIRTIO_GPIO_REQ_IRQ_TYPE} request is initiated by the driver to
+request the device to set the IRQ trigger type (one of
+\field{VIRTIO_GPIO_IRQ_TYPE_*}) for a GPIO line configured for input. The =
driver
+sends the \field{struct virtio_gpio_request} to the device, with the IRQ t=
rigger
+type set in the \field{data} field, and the device responds with \field{st=
ruct
+virtio_gpio_response}. The responds doesn't use the \field{data} field.
+
+This request is only supported if the \field{VIRTIO_GPIO_F_IRQ} feature is
+supported by the device.
+
+\subsubsection{Device Operation: IRQ Mask}\label{sec:Device Types / GPIO D=
evice / Device Operation / IRQ Mask }
+
+The \field{VIRTIO_GPIO_REQ_IRQ_MASK} request is initiated by the driver to
+request the device to mask the specified GPIO line for interrupts. The dri=
ver
+sends the \field{struct virtio_gpio_request} to the device, and the device
+responds with \field{struct virtio_gpio_response}. Neither the request, no=
r the
+response uses the \field{data} field.
+
+This request is only supported if the \field{VIRTIO_GPIO_F_IRQ} feature is
+supported by the device.
+
+\subsubsection{Device Operation: IRQ Unmask}\label{sec:Device Types / GPIO=
 Device / Device Operation / IRQ Unmask }
+
+The \field{VIRTIO_GPIO_REQ_IRQ_UNMASK} request is initiated by the driver =
to
+request the device to unmask the specified GPIO line for interrupts. The d=
river
+sends the \field{struct virtio_gpio_request} to the device, and the device
+responds with \field{struct virtio_gpio_response}. Neither the request, no=
r the
+response uses the \field{data} field.
+
+This request is only supported if the \field{VIRTIO_GPIO_F_IRQ} feature is
+supported by the device.
+
+\subsubsection{Device Operation: IRQ Event}\label{sec:Device Types / GPIO =
Device / Device Operation / IRQ Event }
+
+The \field{VIRTIO_GPIO_IRQ_EVENT} request is the only request initiated by=
 the
+device to inform the driver that an interrupt is detected on one of the GP=
IO
+lines configured for input. The device sends the \field{struct
+virtio_gpio_request} to the driver, and the driver responds with \field{st=
ruct
+virtio_gpio_response}. This is the only request that uses the \field{inter=
rupt}
+virtqueue, while all other requests use the \field{command} virtqueue. Nei=
ther
+the request, nor the response uses the \field{data} field.
+
+This request is only supported if the \field{VIRTIO_GPIO_F_IRQ} feature is
+supported by the device.
+
+
+\drivernormative{\subsubsection}{Device Operation}{Device Types / GPIO Dev=
ice / Device Operation}
+
+A driver MUST set all the fields of the \field{struct virtio_gpio_request}
+before sending the request, except for the requests where the \field{data}=
 field
+isn't used by the request type.
+
+A driver MUST NOT use the \field{data} field in the response message if th=
e
+\field{status} returned from the device is \field{VIRTIO_GPIO_STATUS_ERR}.
+
+A driver MUST NOT try to set value of a GPIO line configured for input.
+
+A driver MUST NOT try to get value of a GPIO line configured for output.
+
+A driver MUST NOT send IRQ related requests for a GPIO line configured for
+output.
+
+A driver MUST NOT initiate IRQ related requests if the \field{VIRTIO_GPIO_=
F_IRQ}
+feature is not supported by the device.
+
+A driver MUST queue only one request at a time and wait for its response b=
efore
+queuing the next request.
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / GPIO Dev=
ice / Device Operation}
+
+A device MUST set the \field{status} field to \field{VIRTIO_GPIO_STATUS_OK=
} for
+all successful requests.
+
+A device MUST set all the fields of the \field{struct virtio_gpio_response=
}
+before sending the response, except for the response where the \field{data=
}
+field isn't used by the request type, unless an error has occurred and it =
has
+set the \field{status} field to \field{VIRTIO_GPIO_STATUS_ERR}.
+
+A device MUST add a valid string in the \field{gpio_names} field of the
+\field{struct virtio_gpio_config} for every supported GPIO line, if the th=
e
+\field{gpio_names_size} is not set to 0.
+
+A device MUST NOT send a request on the \field{interrupt} virtqueue if the
+\field{VIRTIO_GPIO_F_IRQ} feature is not supported by it.
--=20
2.31.1.272.g89b43f80a514


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/


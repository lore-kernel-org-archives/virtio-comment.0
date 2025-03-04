Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F053442C
	for <virtio-comment@lists.linux.dev>; Tue,  4 Mar 2025 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741093327; cv=none; b=bWfEflG+eXPC/AEdWTQixRwYgELVc4tTitvc92iX50gFuIQWGTrM6kv6pKdclojA4jN3gMM++lL/mKGspvroImgevJQO5ZGEr6huWInkadg5xzvBddhGtmerf/CVvd+jnN2HTJRmKvxQVBLD7Pu6wjAfw3oJaw3OMJKMQv77VfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741093327; c=relaxed/simple;
	bh=DBKU7xkfuDumHBtM2oaao9i0xTzEJ3LRLeNmICA3Ilg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:content-type; b=cyrBGvhq9PhS/RNOjsKIBQo3AAfjzhIEkQkCDy8N7nbGuub7aD38CjrRkB3U8/9pd+J2XoxqhdYc0ruL96iaUGhwGeXvVI44nVeUggBM2rh4LR8uQv0P9YDLxsS+ChtpdjZ9RAk0F03fJZKb97gnsbBnx5ICfe32z5GlebPlTzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MoJOrduq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MoJOrduq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741093323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TmJs6fSOEvfFwBQ+yTYSE7GY9fWSEm+CWhIY4yqL0j0=;
	b=MoJOrduqy97OrFXKfL6s1mbT2zbSLlvhuKnRxTQ4DaIwHQ3aaoOSVDePojISB3cGiOG9vj
	8EbcEQZKCkkMfrqS3Bao1RSMeSbyeZiihAHqhmtJUVP36wvOs9OVnJf5vAGLAKJ3u8JViY
	EmL8G5HVChe2vGSPym0u3UoLi+dTcBg=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-684-hREhFDRQNe-0i7a4JLaNUg-1; Tue,
 04 Mar 2025 08:01:55 -0500
X-MC-Unique: hREhFDRQNe-0i7a4JLaNUg-1
X-Mimecast-MFC-AGG-ID: hREhFDRQNe-0i7a4JLaNUg_1741093312
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E2BBB1800879;
	Tue,  4 Mar 2025 13:01:51 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.34.87])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 45B8B19560B9;
	Tue,  4 Mar 2025 13:01:43 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: nicolas.dufresne@collabora.com,
	cohuck@redhat.com,
	adelva@google.com,
	mvaralar@redhat.com,
	hverkuil@xs4all.nl,
	mst@redhat.com,
	dverkamp@chromium.org,
	gurchetansingh@google.com,
	alex.bennee@linaro.org,
	changyeon@google.com,
	daniel.almeida@collabora.com,
	agordeev@qti.qualcomm.com,
	gnurou@gmail.com,
	eballetb@redhat.com,
	ribalda@google.com,
	Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v8 1/1] virtio-media: Add virtio media device specification
Date: Tue,  4 Mar 2025 14:01:34 +0100
Message-ID: <20250304130134.1856056-2-aesteve@redhat.com>
In-Reply-To: <20250304130134.1856056-1-aesteve@redhat.com>
References: <20250304130134.1856056-1-aesteve@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: At01y_smYxf6YEPSQmX9elU0zpQq9rVmMyRmfHZ8S1Y_1741093312
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Virtio-media is an encapsulation of the V4L2 UAPI into
virtio, able to virtualize any video device supported
by V4L2.

Note that virtio-media does not require the use of a
V4L2 device driver on the host or guest side -
V4L2 is only used as a host-guest protocol,
and both sides are free to convert it from/to any
model that they wish to use.

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 conformance.tex                           |  12 +-
 content.tex                               |   1 +
 device-types/media/description.tex        | 639 ++++++++++++++++++++++
 device-types/media/device-conformance.tex |  15 +
 device-types/media/driver-conformance.tex |  11 +
 5 files changed, 674 insertions(+), 4 deletions(-)
 create mode 100644 device-types/media/description.tex
 create mode 100644 device-types/media/device-conformance.tex
 create mode 100644 device-types/media/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index dc00e84..2564034 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -32,8 +32,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / Memory Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / I2C Adapter Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance} or
-\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / Media Driver Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -59,8 +60,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / Memory Device Conformance},
 \ref{sec:Conformance / Device Conformance / I2C Adapter Device Conformance},
 \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
-\ref{sec:Conformance / Device Conformance / GPIO Device Conformance} or
-\ref{sec:Conformance / Device Conformance / PMEM Device Conformance}.
+\ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
+\ref{sec:Conformance / Device Conformance / PMEM Device Conformance} or
+\ref{sec:Conformance / Device Conformance / Media Device Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -152,6 +154,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/media/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -238,6 +241,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/media/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index 0a62dce..59925ae 100644
--- a/content.tex
+++ b/content.tex
@@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/media/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/media/description.tex b/device-types/media/description.tex
new file mode 100644
index 0000000..0527da7
--- /dev/null
+++ b/device-types/media/description.tex
@@ -0,0 +1,639 @@
+\section{Media Device}\label{sec:Device Types / Media Device}
+
+The virtio media device follows the same model (and structures) as V4L2. It
+can be used to virtualize cameras, codec devices, or any other device
+supported by V4L2. The complete definition of V4L2 structures and ioctls can
+be found under the
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/index.html}{V4L2 UAPI documentation}.
+
+V4L2 is a UAPI that allows a less privileged entity (user-space) to use video
+hardware exposed by a more privileged entity (the kernel). Virtio-media is an
+encapsulation of this API into virtio, turning it into a virtualization API
+for all classes of video devices supported by V4L2, where the device plays the
+role of the kernel and the driver the role of user-space.
+
+The device is therefore responsible for presenting a virtual device that behaves
+like an actual V4L2 device, which the driver can control.
+
+Note that virtio-media does not require the use of a V4L2 device driver or of
+Linux on any side - V4L2 is only used as a transport protocol,
+and both sides are free to convert it from/to any model that they wish to use.
+
+\subsection{Device ID}\label{sec:Device Types / Media Device / Device ID}
+
+48
+
+\subsection{Virtqueues}\label{sec:Device Types / Media Device / Virtqueues}
+
+\begin{description}
+\item[0] commandq - used for driver commands and device responses to these
+commands.
+\item[1] eventq - used for events sent by the device to the driver.
+\end{description}
+
+\subsection{Feature Bits}\label{sec:Device Types / Media Device / Feature Bits}
+
+None
+
+\subsection{Device Configuration Layout}\label{sec:Device Types / Media Device / Device Configuration Layout}
+
+The video device configuration space uses the following layout:
+
+\begin{lstlisting}
+struct virtio_media_config {
+    le32 device_caps;
+    le32 device_type;
+    le8 card[32];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{device_caps}] (driver-read-only) flags representing the device
+capabilities as used in
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-querycap.html#c.V4L.v4l2_capability}{struct v4l2_capability}.
+It corresponds with the \field{device_caps} field in the \textit{struct video_device}.
+\item[\field{device_type}] (driver-read-only) informs the driver of the type
+of the video device. It corresponds with the \field{vfl_devnode_type} field of the device.
+\item[\field{card}] (driver-read-only) name of the device, a NUL-terminated
+UTF-8 string. It corresponds with the \field{card} field of the \textit{struct v4l2_capability}.
+If all the characters of the field are used, it does not need to be NUL-terminated.
+\end{description}
+
+\subsection{Device Initialization}
+
+A driver executes the following sequence to initialize a device:
+
+\begin{enumerate}
+\item Read the \field{device_caps} and \field{device_type} fields
+from the configuration layout to identify the device.
+\item Set up the \field{commandq} and \field{eventq} virtqueues.
+\item May open a session (see Section \ref{sec:Device Types / Media Device / Device Operation / Open Device})
+to use the device and send V4L2 ioctls in order to receive more information
+about the device, such as supported formats or controls.
+\end{enumerate}
+
+\subsection{Device Operation}\label{sec:Device Types / Media Device / Device Operation}
+
+The driver enqueues commands in the command queue for the device to process.
+The errors returned by each command are standard
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/gen-errors.html}{Linux kernel error codes}.
+For instance, a driver sending a command that contains invalid options will
+receive \textit{EINVAL} in return, after the device tries to process it.
+
+The device enqueues events in the event queue for the driver to process.
+
+\subsubsection{Command Virtqueue}
+
+\paragraph{Device Operation: Command headers}
+
+\begin{lstlisting}
+#define VIRTIO_MEDIA_CMD_OPEN 1
+#define VIRTIO_MEDIA_CMD_CLOSE 2
+#define VIRTIO_MEDIA_CMD_IOCTL 3
+#define VIRTIO_MEDIA_CMD_MMAP 4
+#define VIRTIO_MEDIA_CMD_MUNMAP 5
+
+/* Header for all virtio commands from the driver to the device on the commandq. */
+struct virtio_media_cmd_header {
+	le32 cmd;
+	le32 __reserved;
+};
+
+/* Header for all virtio responses from the device to the driver on the commandq. */
+struct virtio_media_resp_header {
+	le32 status;
+	le32 __reserved;
+};
+\end{lstlisting}
+
+A command consists of a command header \textit{virtio_media_cmd_header}
+containing the following device-readable field:
+
+\begin{description}
+\item[\field{cmd}] specifies a device request type (VIRTIO_MEDIA_CMD_*).
+\end{description}
+
+A response consists of a response header \textit{virtio_media_resp_header}
+containing the following device-writable field:
+
+\begin{description}
+\item[\field{status}] indicates a device request status.
+\end{description}
+
+When the device executes the command successfully, the value of the status
+field is 0. Conversely, when the device fails to execute the command, the value
+of the status fields corresponds with one of the standard Linux error codes.
+
+\drivernormative{\paragraph}{Device Operation: Command Virtqueue: Sessions}{Device Types / Media Device / Device Operation / Command Virtqueue}
+
+Sessions are how the device is multiplexed, allowing several distinct works to
+take place simultaneously. Before starting operation, the driver needs to open
+a session. This is equivalent to opening the \textit{/dev/videoX} file of the
+V4L2 device. Each session gets a unique ID assigned, which can be then used
+to perform actions on it.
+
+\paragraph{Device Operation: Open device}\label{sec:Device Types / Media Device / Device Operation / Open Device}
+
+\textbf{VIRTIO_MEDIA_CMD_OPEN} Command for creating a new session.
+
+This is the equivalent of calling \textit{open} on a V4L2 device node.
+The driver uses \textit{virtio_media_cmd_open} to send an open request.
+
+\begin{lstlisting}
+struct virtio_media_cmd_open {
+    struct virtio_media_cmd_header hdr;
+};
+\end{lstlisting}
+
+The device responds to \textit{VIRTIO_MEDIA_CMD_OPEN} with \textit{virtio_media_resp_open}.
+
+\begin{lstlisting}
+struct virtio_media_resp_open {
+    struct virtio_media_resp_header hdr;
+    le32 session_id;
+    le32 __reserved;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{session_id}] identifies the current session, which is used for
+other commands, predominantly ioctls.
+\end{description}
+
+\devicenormative{\subparagraph}{Device Operation: Open device}{Device Types / Media Device / Device Operation / Open device}
+
+Upon success, the device MUST set a \field{session_id} in \textit{virtio_media_resp_open}
+to an integer that is NOT used by any other open session.
+
+\paragraph{Device Operation: Close device}
+
+\textbf{VIRTIO_MEDIA_CMD_CLOSE} Command for closing an active session.
+
+This is the equivalent of calling \textit{close} on a previously opened V4L2
+device node. All resources associated with this session will be freed.
+
+This command does not require a response from the device.
+
+\begin{lstlisting}
+struct virtio_media_cmd_close {
+    struct virtio_media_cmd_header hdr;
+    le32 session_id;
+    le32 __reserved;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{session_id}] identifies the session to close.
+\end{description}
+
+\drivernormative{\subparagraph}{Device Operation: Close device}{Device Types / Media Device / Device Operation / Close device}
+
+The session ID SHALL NOT be used again after queueing this command, until it has
+been obtained again through a subsequent \textit{VIRTIO_MEDIA_CMD_OPEN} call.
+
+\paragraph{Device Operation: V4L2 ioctls}
+
+\textbf{VIRTIO_MEDIA_CMD_IOCTL} Command for executing an ioctl on an open
+session.
+
+This command tells the device to run one of the `VIDIOC_*` ioctls on the
+session identified by \textit{session_id}.
+
+\begin{lstlisting}
+struct virtio_media_cmd_ioctl {
+    struct virtio_media_cmd_header hdr;
+    le32 session_id;
+    le32 code;
+    /* Followed by the relevant ioctl command payload as defined in the macro */
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{session_id}] identifies the session to run the ioctl on.
+\item[\field{code}] specifies the code of the \field{VIDIOC_*} ioctl to run.
+\end{description}
+
+The code is extracted from the
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/videodev.html}{videodev2.h},
+header file. The file defines the ioctl's codes, type of payload, and
+direction. The code consists of the second argument of the \field{_IO*} macro.
+
+For example, the \textit{VIDIOC_G_FMT} is defined as follows:
+
+\begin{lstlisting}
+#define VIDIOC_G_FMT _IOWR('V',  4, struct v4l2_format)
+\end{lstlisting}
+
+This means that its ioctl code is \textit{4}, its payload is a
+\textit{struct v4l2_format}, and its direction is \textit{WR} (i.e., the
+payload is written by both the driver and the device).
+See Section \ref{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
+for more information about the direction of ioctls.
+
+The payload struct layout always matches the 64-bit, little-endian
+representation of the corresponding V4L2 structure.
+
+The device responds to \textit{VIRTIO_MEDIA_CMD_IOCTL} with \textit{virtio_media_resp_ioctl}.
+
+\begin{lstlisting}
+struct virtio_media_resp_ioctl {
+    struct virtio_media_resp_header hdr;
+    /* Followed by the ioctl response payload as defined in the macro */
+};
+\end{lstlisting}
+
+\subparagraph{Ioctls payload}\label{sec:Device Types / Media Device / V4L2 ioctls / Ioctls payload}
+
+Each ioctl has a payload, which is defined by the third argument of the
+\field{_IO*} macro. 
+
+The payload of an ioctl in the descriptor chain follows the command structure,
+the response structure, or both depending on the direction:
+
+\begin{itemize}
+\item \textbf{_IOR} is read-only for the driver, meaning the payload
+follows the response in the device-writable section of the descriptor chain.
+\item \textbf{_IOW} is read-only for the device, meaning the payload
+follows the command in the device-readable section of the descriptor chain.
+\item \textbf{_IOWR} is writable by both the device and driver,
+meaning the payload must follow both the command in the device-readable section
+of the descriptor chain, and the response in the device-writable section.
+\end{itemize}
+
+A possible optimization for \textit{WR} ioctls is to provide the payload using
+descriptors that both point to the same buffer. This mimics the behavior of
+V4L2 ioctls where the data is only passed once and used as both input and
+output by the kernel.
+
+\devicenormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Types / Media Device / Device Operation / V4L2 ioctls}
+
+In case of success of a device-writable ioctl, the device MUST always write the
+payload in the device-writable part of the descriptor chain.
+
+In case of failure of a device-writable ioctl, the device is free to write the
+payload in the device-writable part of the descriptor chain or not. Some errors
+may still result in the payload being updated, and in this case the device is
+expected to write the updated payload. 
+
+\drivernormative{\subparagraph}{Device Operation: V4L2 ioctls}{Device Types / Media Device / Device Operation / V4L2 ioctls}
+
+For most V4L2 structures, the size is identical for both 32 and 64 bits versions.
+If the payload struct layout size differs for 32 and 64 bits, the driver
+MUST translate them to its the 64-bit, little-endian representation.
+
+If the device has not written the payload after an error (i.e., only the
+header is returned), the driver MUST assume that the payload has not
+been modified.
+
+\subparagraph{Handling of pointers to data in ioctl payload}
+\label{sec:Device Types / Media Device / V4L2 ioctls / Pointers in V4l2 ioctls}
+
+A few structures used as ioctl payloads contain pointers to further
+data needed for the ioctl. There are notably:
+
+\begin{itemize}
+\item The \field{planes} pointer of
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-buffer}{struct v4l2_buffer},
+which size is determined by the length member.
+\item The \field{controls} pointer of
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/vidioc-g-ext-ctrls.html#c.V4L.v4l2_ext_controls}{struct v4l2_ext_controls},
+which size is determined by the count member.
+\end{itemize}
+
+If the size of the pointed area is non-zero, then the main
+payload is immediately followed by the pointed data in their order of
+appearance in the structure.
+
+\devicenormative{\subparagraph}{Handling of pointers to data in ioctl payload}{Device Types / Media Device / Device Operation / Pointers in V4l2 ioctls}
+
+The pointer value, when its area is non-zero, is ignored by the device,
+which MUST return the value initially passed by the driver.
+
+
+\subparagraph{Handling of pointers to userspace memory in ioctl payload}
+\label{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
+
+A few pointers (used for \textit{SHARED_PAGES} memory type,
+see \ref{sec:Device Types / Media Device / Device Operation / Shared Pages})
+are special in that they point to userspace memory in the
+original V4L2 specification. They are:
+
+\begin{itemize}
+\item The \field{m.userptr} member of \textit{struct v4l2_buffer} and
+\href{https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/buffer.html#struct-v4l2-plane}{struct v4l2_plane}
+(technically an unsigned long, but designated a userspace address).
+\item The \field{ptr} member of \textit{struct v4l2_ext_ctrl}.
+\end{itemize}
+
+These pointers may cover large areas of scattered memory, which has the
+potential to require more descriptors than the virtio queue can provide. For
+these particular pointers only, a list of \textit{struct virtio_media_sg_entry}
+that covers the needed amount of memory for the pointer is used instead of
+using descriptors to map the pointed memory directly.
+
+\begin{lstlisting}
+struct virtio_media_sg_entry {
+	le64 start;
+	le32 len;
+	le32 __reserved;
+};
+\end{lstlisting}
+
+For each such pointer to read, the device reads as many SG entries as needed
+to cover the length of the pointed buffer, as described by its parent
+structure (\field{length} member of \textit{struct v4l2_buffer} or
+\textit{struct v4l2_plane} for buffer memory, and \field{size} member of
+\textit{struct v4l2_ext_control} for control data).
+
+Since the device never needs to modify the list of SG entries, it is only
+provided by the driver in the device-readable section of the descriptor chain,
+and not repeated in the device-writable section, even for WR ioctls.
+
+\subparagraph{Unsupported ioctls}
+
+A few ioctls are replaced by other, more suitable mechanisms.
+
+\begin{itemize}
+\item \textit{VIDIOC_QUERYCAP} is replaced by reading the configuration area
+(see \ref{sec:Device Types / Media Device / Device Configuration Layout}).
+\item \textit{VIDIOC_DQBUF} and \textit{VIDIOC_DQEVENT} are replaced by a dedicated event
+(see \ref{sec:Device Types / Media Device / Device Operation / Event Virtqueue}).
+\item \textit{VIDIOC_G_JPEGCOMP} and \textit{VIDIOC_S_JPEGCOMP} are deprecated
+and replaced by the controls of the JPEG class.
+\item \textit{VIDIOC_LOG_STATUS} is a driver-only operation and shall not be
+implemented by the device.
+\end{itemize}
+
+\devicenormative{\subparagraph}{Device Operation: Unsupported ioctls}{Device Types / Media Device / Device Operation / Unsupported ioctls}
+
+When a request is not supported, the device MUST return \textit{ENOTTY},
+which corresponds to the response for unknown ioctls.
+
+\paragraph{Device Operation: Mapping a MMAP buffer}
+
+\textbf{VIRTIO_MEDIA_CMD_MMAP} Command for mapping a MMAP buffer into the
+driver's address space.
+
+Shared memory region ID 0 is used to map MMAP buffers with
+the \textit{VIRTIO_MEDIA_CMD_MMAP} command.
+
+\begin{lstlisting}
+#define VIRTIO_MEDIA_MMAP_FLAG_RW (1 << 0)
+
+struct virtio_media_cmd_mmap {
+	struct virtio_media_cmd_header hdr;
+	le32 session_id;
+	le32 flags;
+	le32 offset;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{session_id}] identifies the session which the mapped buffer pertains to.
+\item[\field{flags}] is the set of flags for the mapping. \field{VIRTIO_MEDIA_MMAP_FLAG_RW}
+can be set if a read-write mapping is desired. Without this flag the mapping
+will be read-only.
+\item[\field{offset}] corresponds to the \field{mem_offset} field of the
+\textit{union v4l2_plane} for the plane to map. This field can be obtained
+using the \textit{VIDIOC_QUERYBUF} ioctl.
+\end{description}
+
+The device responds to \textit{VIRTIO_MEDIA_CMD_MMAP} with \textit{virtio_media_resp_mmap}.
+
+\begin{lstlisting}
+struct virtio_media_resp_mmap {
+    struct virtio_media_resp_header hdr;
+    le64 driver_addr;
+    le64 len;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{driver_addr}] offset into SHM region ID 0 of the start of the mapping.
+\item[\field{len}] length of the mapping as indicated by the \textit{struct v4l2_plane}
+the buffer belongs to.
+\end{description}
+
+\devicenormative{\subparagraph}{Device Operation: Mapping a MMAP buffer}{Device Types / Media Device / Device Operation / Mapping a MMAP buffer}
+
+The \textit{len} parameter of the \textit{virtio_media_resp_mmap} response sent
+by the device MUST always be equal to the length of the buffer.
+
+\paragraph{Device Operation: Unmapping a MMAP buffer}
+
+\textbf{VIRTIO_MEDIA_CMD_MUNMAP} unmaps a MMAP buffer previously mapped using \field{VIRTIO_MEDIA_CMD_MMAP}.
+
+\begin{lstlisting}
+struct virtio_media_cmd_munmap {
+    struct virtio_media_cmd_header hdr;
+    le64 driver_addr;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{driver_addr}] offset into SHM region ID 0 previously returned by 
+\textit{VIRTIO_MEDIA_CMD_MMAP} at which the buffer has been previously mapped.
+\end{description}
+
+The device responds to \textit{VIRTIO_MEDIA_CMD_MUNMAP} with \textit{virtio_media_resp_munmap}.
+
+\begin{lstlisting}
+struct virtio_media_resp_munmap {
+    struct virtio_media_resp_header hdr;
+};
+\end{lstlisting}
+
+\devicenormative{\subparagraph}{Device Operation: Unmapping a MMAP buffer}{Device Types / Media Device / Device Operation / Unmapping a MMAP buffer}
+
+The device MUST keep mappings performed using \textit{VIRTIO_MEDIA_CMD_MMAP}
+valid until \textit{VIRTIO_MEDIA_CMD_MUNMAP} is called, even if the buffers or
+session they belong to are released or closed by the driver.
+
+\paragraph{Device Operation: Memory Types}
+
+The semantics of the three V4L2 memory types (\textit{MMAP}, \textit{USERPTR}
+and \textit{DMABUF}) can easily be mapped to both driver and device context.
+
+\begin{lstlisting}
+enum virtio_media_memory {
+    VIRTIO_MEDIA_MMAP = V4L2_MEMORY_MMAP,
+    VIRTIO_MEDIA_SHARED_PAGES = V4L2_MEMORY_USERPTR,
+    VIRTIO_MEDIA_OBJECT = V4L2_MEMORY_DMABUF,
+};
+\end{lstlisting}
+
+\subparagraph{MMAP}
+
+\textit{MMAP} memory type is the semantic equivalent of
+\textit{V4L2_MEMORY_MMAP} in regular V4L2. 
+
+In virtio-media, \textit{MMAP} buffers are provisioned by the device, just like
+they are by the kernel in regular V4L2. Similarly to how userspace can map a
+\textit{MMAP} buffer into its address space using mmap and munmap, the
+virtio-media driver can map device buffers into the driver space by queueing the
+\textit{struct virtio_media_cmd_mmap} and \textit{struct virtio_media_cmd_munmap}
+commands to the commandq.
+
+\subparagraph{SHARED_PAGES}
+\label{sec:Device Types / Media Device / Device Operation / Shared Pages}
+
+\textit{SHARED_PAGES} memory type is the semantic equivalent of
+\textit{V4L2_MEMORY_USERPTR} in regular V4L2. 
+
+In virtio-media, \textit{SHARED_PAGES} buffers are provisioned by the driver,
+and use guest physical addresses. Instances of \textit{struct v4l2_buffer}
+and \textit{struct v4l2_plane} of this memory type are followed by a list of
+\textit{struct virtio_media_sg_entry}. For more information, see
+\ref{sec:Device Types / Media Device / V4L2 ioctls / Userspace memory}
+
+\devicenormative{\subparagraph}{Device Operation: Shared Pages}{Device Types / Media Device / Device Operation / Shared Pages}
+
+The device MUST not alter the pointer values provided by the driver, i.e.
+the \field{m.userptr} member of \textit{struct v4l2_buffer} and
+\textit{struct v4l2_plane} MUST be returned to the driver with the same value
+as it was provided.
+
+\subparagraph{VIRTIO_OBJECT}
+\label{sec:Device Types / Media Device / Device Operation / Virtio Object}
+
+\textit{VIRTIO_OBJECT} memory type is the semantic equivalent of
+\textit{V4L2_MEMORY_DMABUF} in regular V4L2. 
+
+In virtio-media, \textit{VIRTIO_OBJECT} buffers are provisioned by a virtio
+object, just like they are by a \textit{DMABUF} in regular V4L2. Virtio objects
+are 16-bytes UUIDs and do not fit in the placeholders for file descriptors, so
+they follow their embedding data structure as needed. For example, in multi-planar
+buffers, \textit{struct v4l2_plane} structures are located after the
+\textit{struct v4l2_buffer} in the memory layout. Then, after the last plane,
+the memory contains an array of UUIDs in which the first element corresponds
+with the first plane, and so on.
+
+Conversely to \textit{SHARED_PAGES} buffers, which SG lists are never
+modified by the device, UUIDs of virtio objects need to be added in both
+the device-readable and device-writable section of the descriptor chain
+so the device can update them if needed.
+
+Device-allocated buffers with the \textit{VIRTIO_MEDIA_MMAP} memory type may also
+be exported as virtio objects for use with another virtio device using the
+\textit{VIDIOC_EXPBUF} ioctl. The fd placefolder of \textit{v4l2_exportbuffer}
+means that space for the UUID needs to be reserved right after that structure.
+
+\devicenormative{\subparagraph}{Device Operation: Virtio Object}{Device Types / Media Device / Device Operation / Virtio Object}
+
+The device MUST leave the \field{fd} placeholder of the V4L2 structure unchanged.
+
+\subsubsection{Event Virtqueue}
+\label{sec:Device Types / Media Device / Device Operation / Event Virtqueue}
+
+Events are asynchronous notifications to the driver. In virtio-media,
+they are used as a replacement for the \textit{VIDIOC_DQBUF} and
+\textit{VIDIOC_DQEVENT} ioctls and the polling mechanism, which would be
+impractical to implement on top of virtio.
+
+\paragraph{Device Operation: Event header}
+
+\begin{lstlisting}
+#define VIRTIO_MEDIA_EVT_ERROR 0
+#define VIRTIO_MEDIA_EVT_DQBUF 1
+#define VIRTIO_MEDIA_EVT_EVENT 2
+
+/* Header for events queued by the device for the driver on the eventq. */
+struct virtio_media_event_header {
+    le32 event;
+    le32 session_id;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{event}] one of \field{VIRTIO_MEDIA_EVT_*}.
+\item[\field{session_id}] ID of the session the event applies to.
+\end{description}
+
+\paragraph{Device Operation: Device-side error}
+
+\textbf{VIRTIO_MEDIA_EVT_ERROR} Unrecoverable session error. Upon
+emitting this event, the device considers the session mentioned in the
+header to be invalid, and returns an error to all future commands
+referring to it. Upon receiving this event, the driver stops using the
+session, and shall close it as soon as possible.
+
+\begin{lstlisting}
+struct virtio_media_event_error {
+    struct virtio_media_event_header hdr;
+    le32 errno;
+    le32 __reserved;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{errno}] error code describing the kind of error that occurred.
+\end{description}
+
+\devicenormative{\subparagraph}{Device Operation: Device-side error}{Device Types / Media Device / Device Operation / Device-side error}
+
+After an error is signaled, when the device considers the session as
+non-existing, the device MUST NOT recycle the session ID until the driver has
+explicitly closed it.
+
+\drivernormative{\subparagraph}{Device Operation: Device-side error}{Device Types / Media Device / Device Operation / Device-side error}
+
+Upon receiving an error event for a session, the driver MUST
+explicitly close the session using a \textit{VIRTIO_MEDIA_CMD_CLOSE} command.
+
+\paragraph{Device Operation: Dequeue buffer}
+\label{sec:Device Types / Media Device / Device Operation / Dequeue buffer}
+
+\textbf{VIRTIO_MEDIA_EVT_DQBUF} signals that a buffer is not being used anymore
+by the device and is returned to the driver.
+
+Every time a buffer previously queued (i.e., using the
+\textit{VIDIOC_QBUF} ioctl) is done being processed, the
+device queues a \textit{struct virtio_media_event_dqbuf} event on
+the eventq, signifying that the buffer may be used again by the driver.
+This is like an implicit \textit{VIDIOC_DQBUF} ioctl.
+
+\begin{lstlisting}
+#define VIRTIO_MEDIA_MAX_PLANES 8
+
+struct virtio_media_event_dqbuf {
+    struct virtio_media_event_header hdr;
+    struct v4l2_buffer buffer;
+    struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{buffer}] \textit{struct v4l2_buffer} describing the buffer that has been dequeued.
+\item[\field{planes}] array of \textit{struct v4l2_plane} containing the plane information for multi-planar buffers.
+\end{description}
+
+Note that in the case of a \field{SHARED_PAGES} buffer, the \textit{struct v4l2_buffer}
+used as event payload is not followed by the buffer's SG entries: since that memory
+is the same that the driver submitted with the \textit{VIDIOC_QBUF}, it would
+be redundant to have it here.
+
+\drivernormative{\subparagraph}{Device Operation: Dequeue buffer}{Device Types / Media Device / Device Operation / Dequeue buffer}
+
+Pointer values in the \textit{struct v4l2_buffer} and \textit{struct v4l2_plane}
+are meaningless and MUST be ignored by the driver. It is recommended that the
+device sets them to NULL in order to avoid leaking potential device addresses.
+
+\paragraph{Device Operation: Emit an event}
+
+\textbf{VIRTIO_MEDIA_EVT_EVENT} Signals that a V4L2 event has been emitted for a session.
+
+Every time an event for which the driver has been previously subcribed to
+(i.e., using the \textit{VIDIOC_SUBSCRIBE_EVENT} ioctl) is signaled, the
+device queues a \textit{struct virtio_media_event_event} event on the eventq.
+This is like an implicit \textit{VIDIOC_DQEVENT} ioctl.
+
+\begin{lstlisting}
+struct virtio_media_event_event {
+    struct virtio_media_event_header hdr;
+    struct v4l2_event event;
+};
+\end{lstlisting}
+
+\begin{description}
+\item[\field{event}] \textit{struct v4l2_event} describing the event that occurred.
+\end{description}
diff --git a/device-types/media/device-conformance.tex b/device-types/media/device-conformance.tex
new file mode 100644
index 0000000..99112ff
--- /dev/null
+++ b/device-types/media/device-conformance.tex
@@ -0,0 +1,15 @@
+\conformance{\subsection}{Media Device Conformance}\label{sec:Conformance / Device Conformance / Media Device Conformance}
+
+A Media device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Open device}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / V4L2 ioctls}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Pointers in V4l2 ioctls}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Unsupported ioctls}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Mapping a MMAP buffer}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Unmapping a MMAP buffer}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Shared Pages}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Virtio Object}
+\item \ref{devicenormative:Device Types / Media Device / Device Operation / Device-side error}
+\end{itemize}
diff --git a/device-types/media/driver-conformance.tex b/device-types/media/driver-conformance.tex
new file mode 100644
index 0000000..eb380ad
--- /dev/null
+++ b/device-types/media/driver-conformance.tex
@@ -0,0 +1,11 @@
+\conformance{\subsection}{Media Driver Conformance}\label{sec:Conformance / Driver Conformance / Media Driver Conformance}
+
+A Media driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / Media Device / Device Operation / Command Virtqueue}
+\item \ref{drivernormative:Device Types / Media Device / Device Operation / Close device}
+\item \ref{drivernormative:Device Types / Media Device / Device Operation / V4L2 ioctls}
+\item \ref{drivernormative:Device Types / Media Device / Device Operation / Device-side error}
+\item \ref{drivernormative:Device Types / Media Device / Device Operation / Dequeue buffer}
+\end{itemize}
-- 
2.48.1


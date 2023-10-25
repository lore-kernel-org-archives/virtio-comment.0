Return-Path: <virtio-comment-return-7960-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08998C0032E
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 23:54:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3E3232B067
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 23:54:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20140986A43
	for <virtio-comment@archiver.kernel.org>; Wed, 25 Oct 2023 23:54:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 00C93986A37; Wed, 25 Oct 2023 23:54:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E1109986A38
	for <virtio-comment@lists.oasis-open.org>; Wed, 25 Oct 2023 23:54:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-IronPort-AV: E=Sophos;i="6.03,252,1694736000"; 
   d="scan'208";a="310398081"
X-Farcaster-Flow-ID: 706e7818-e405-4fa8-8eb4-bcd23521d618
From: Alexander Graf <graf@amazon.com>
To: <virtio-comment@lists.oasis-open.org>
CC: Petre Eftime <petre.eftime@gmail.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Arnd Bergmann <arnd@arndb.de>
Date: Wed, 25 Oct 2023 23:53:45 +0000
Message-ID: <20231025235345.17788-1-graf@amazon.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.253.83.51]
X-ClientProxiedBy: EX19D042UWA001.ant.amazon.com (10.13.139.92) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [virtio-comment] [PATCH] nsm: Add NSM description

The virtio NitroSecureModule is a device with a very stripped down
Trusted Platform Module functionality, which is used in the
context of a Nitro Enclave (see \url{https://lkml.org/lkml/2020/4/21/1020})
to provide boot time measurement and attestation.

This patch describes the communication protocol between device and
driver for the NitroSecureModule virtio device.

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 conformance.tex                         |   2 +
 content.tex                             |   1 +
 device-types/nsm/description.tex        | 355 ++++++++++++++++++++++++
 device-types/nsm/device-conformance.tex |  13 +
 device-types/nsm/driver-conformance.tex |  13 +
 5 files changed, 384 insertions(+)
 create mode 100644 device-types/nsm/description.tex
 create mode 100644 device-types/nsm/device-conformance.tex
 create mode 100644 device-types/nsm/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index dc00e84..5c7fbb3 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -152,6 +152,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/driver-conformance.tex}
 \input{device-types/gpio/driver-conformance.tex}
 \input{device-types/pmem/driver-conformance.tex}
+\input{device-types/nsm/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -238,6 +239,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/scmi/device-conformance.tex}
 \input{device-types/gpio/device-conformance.tex}
 \input{device-types/pmem/device-conformance.tex}
+\input{device-types/nsm/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index 0a62dce..1075154 100644
--- a/content.tex
+++ b/content.tex
@@ -767,6 +767,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/scmi/description.tex}
 \input{device-types/gpio/description.tex}
 \input{device-types/pmem/description.tex}
+\input{device-types/nsm/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/nsm/description.tex b/device-types/nsm/description.tex
new file mode 100644
index 0000000..ff1584e
--- /dev/null
+++ b/device-types/nsm/description.tex
@@ -0,0 +1,355 @@
+\section{NSM Device}\label{sec:Device Types / NSM Device}
+
+The virtio NitroSecureModule is a device with a very stripped down
+Trusted Platform Module functionality, which is used in the
+context of a Nitro Enclave (see \url{https://lkml.org/lkml/2020/4/21/1020})
+to provide boot time measurement and attestation.
+
+Since this device provides some critical cryptographic operations,
+there are a series of operations which are required to have guarantees
+of atomicity, ordering and consistency: operations fully succeed or fully
+fail, including when some external events might interfere in the
+process: live migration, crashes, etc; any failure in the critical
+section requires termination of the enclave it is attached to, so
+the device needs to be as resilient as possible, simplicity is
+strongly desired.
+
+To account for that, the device and driver are made to have very few
+error cases in the critical path and the operations themselves can be
+rolled back and retried if events happen outside the critical
+area, while processing a request. The driver itself can be made very
+simple and thus is easily portable.
+
+Since the requests can be handled directly in the virtio queue, serving
+most requests requires no additional buffering or memory allocations
+on the host side.
+
+\subsection{Device ID}\label{sec:Device Types / NSM Device / Device ID}
+  33
+
+\subsection{Virtqueues}\label{sec:Device Types / NSM Device / Virtqueues}
+\begin{description}
+\item[0] nsm.vq.0
+\end{description}
+
+\subsection{Feature bits}\label{sec:Device Types / NSM Device / Feature bits}
+
+None.
+
+\subsection{Device configuration layout}\label{sec:Device Types / NSM Device / Device configuration layout}
+
+None.
+
+\subsection{Device Initialization}\label{sec:Device Types / NSM Device / Device Initialization}
+
+The driver initializes nsm.vq.0 in preparation for issuing commands and receiving their reponses.
+
+\subsection{Device Operations}\label{sec:Device Types / NSM Device / Device Operations}
+
+Driver sends a single CBOR encoded request on the request virtqueue, notifies
+the device and waits for the device to return the request with a response in
+the used ring. The request must be inside a buffer of exactly 0x1000 bytes.
+The reply buffer must be exactly 0x3000 bytes large.
+
+The driver sends requests with the following format:
+
+\begin{lstlisting}
+struct virtio_nsm_req {
+        u8 cbor_req[0x1000];
+};
+\end{lstlisting}
+
+\field{cbor_req} is the CBOR encoded request data. See \url{http://cbor.io/} for information about CBOR.
+
+Possible requests are:
+
+\begin{itemize}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / DescribePCR]{DescribePCR}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / ExtendPCR]{ExtendPCR}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / LockPCR]{LockPCR}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / LockPCRs]{LockPCRs}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / DescribeNSM]{DescribeNSM}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / Attestation]{Attestation}
+\item \hyperref[sec:Device Types / NSM Device / Device Operations / GetRandom]{GetRandom}
+\end{itemize}
+
+Every request always triggers a single reponse in the response descriptor with the following format:
+
+\begin{lstlisting}
+struct virtio_nsm_resp {
+        u8 cbor_resp[0x3000];
+};
+\end{lstlisting}
+
+\field{cbor_resp} is the CBOR encoded response data. See \url{http://cbor.io/} for information
+  about CBOR. It contains either the request specific response or a generic error response:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("Error"),
+  value = String(error_name),
+}
+\end{lstlisting}
+
+where \field{error_name} can be one of
+\begin{itemize}
+\item InvalidArgument
+\item InvalidIndex
+\item InvalidResponse
+\item ReadOnlyIndex
+\item InvalidOperation
+\item BufferTooSmall
+\item InputTooLarge
+\item InternalError
+\end{itemize}
+
+\subsubsection{DescribePCR}\label{sec:Device Types / NSM Device / Device Operations / DescribePCR}
+
+The driver requests a description of the current hash value of a particular
+PCR value. The device responds with the hash value.
+
+\drivernormative{\paragraph}{DescribePCR}{Device Types / NSM Device / Device Operations / DescribePCR}
+
+\begin{lstlisting}
+Map(1) {
+  ring("DescribePCR"),
+  value = Map(1) {
+    key = String("index"),
+    value = Int(pcr)
+  }
+}
+\end{lstlisting}
+
+\field{pcr} The PCR index to return the current hash value for.
+
+\devicenormative{\paragraph}{DescribePCR}{Device Types / NSM Device / Device Operations / DescribePCR}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("DescribePCR"),
+  value = Map(2) {
+    key = String("data"),
+    value = Array(),
+    key = String("lock"),
+    value = Bool()
+  }
+}
+\end{lstlisting}
+
+\field{data} The hash value of the selected PCR
+\field{lock} True if the PCR value is locked and thus immutable, False otherwise
+
+\subsubsection{ExtendPCR}\label{sec:Device Types / NSM Device / Device Operations / ExtendPCR}
+
+The driver requests to add binary data to a PCR value which the device then
+appends to the PCR hash value. The device responds with the new PCR value.
+
+\drivernormative{\paragraph}{ExtendPCR}{Device Types / NSM Device / Device Operations / ExtendPCR}
+
+\begin{lstlisting}
+Map(1) {
+  key = String("ExtendPCR"),
+  value = Map(2) {
+    key = String("index"),
+    value = Int(pcr),
+    key = String("data"),
+    value = Array(data)
+  }
+}
+\end{lstlisting}
+
+\field{pcr} The PCR index to return the current hash value for.
+\field{data} The binary data to cryptographically append to the PCR value
+
+\devicenormative{\paragraph}{ExtendPCR}{Device Types / NSM Device / Device Operations / ExtendPCR}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("ExtendPCR"),
+  value = Map(1) {
+    key = String("data"),
+    value = Array(data)
+  }
+}
+\end{lstlisting}
+
+\field{data} The new hash value of the selected PCR
+
+\subsubsection{LockPCR}\label{sec:Device Types / NSM Device / Device Operations / LockPCR}
+
+The driver requests to set a PCR to locked state. A PCR in locked state becomes
+immutable for the lifetime of the enclave. The device reponds with an error or
+success message.
+
+\drivernormative{\paragraph}{LockPCR}{Device Types / NSM Device / Device Operations / LockPCR}
+
+The driver requests to lock the PCR using the following message:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("LockPCR"),
+  value = Map(1) {
+    key = String("index"),
+    value = Int(pcr)
+  }
+}
+\end{lstlisting}
+
+\field{pcr} The PCR index to lock
+
+\devicenormative{\paragraph}{LockPCR}{Device Types / NSM Device / Device Operations / LockPCR}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+String("LockPCR")
+\end{lstlisting}
+
+\subsubsection{LockPCRs}\label{sec:Device Types / NSM Device / Device Operations / LockPCRs}
+
+The driver requests to set multiple PCR to locked state. A PCR in locked state becomes
+immutable for the lifetime of the enclave. The device reponds with an error or
+success message.
+
+\drivernormative{\paragraph}{LockPCRs}{Device Types / NSM Device / Device Operations / LockPCRs}
+
+The driver requests to lock multiple PCRs using the following message:
+\begin{lstlisting}
+Map(1) {
+  key = String("LockPCRs"),
+  value = Map(1) {
+    key = String("range"),
+    value = Int(pcr)
+  }
+}
+\end{lstlisting}
+
+\field{pcr} The highest index to lock. All PCR indext from 0 to this number will get locked.
+
+\devicenormative{\paragraph}{LockPCRs}{Device Types / NSM Device / Device Operations / LockPCRs}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+String("LockPCRs")
+\end{lstlisting}
+
+\subsubsection{DescribeNSM}\label{sec:Device Types / NSM Device / Device Operations / DescribeNSM}
+
+The driver requests to receive information about the NSM device and its current
+configuration. The device responds with an error or the data.
+
+\drivernormative{\paragraph}{DescribeNSM}{Device Types / NSM Device / Device Operations / DescribeNSM}
+
+The driver requests to receive information about the NSM device using the following message:
+\begin{lstlisting}
+String("DescribeNSM"),
+\end{lstlisting}
+
+\devicenormative{\paragraph}{DescribeNSM}{Device Types / NSM Device / Device Operations / DescribeNSM}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("DescribeNSM"),
+  value = Map(7) {
+    key = String("digest"),
+    value = String(digest),
+    key = String("max_pcrs"),
+    value = Int(max_pcrs),
+    key = String("module_id"),
+    value = String(module_id),
+    key = String("locked_pcrs"),
+    value = Array<u16>(locked_pcrs)
+    key = String("version_major"),
+    value = Int(major),
+    key = String("version_minor"),
+    value = Int(minor),
+    key = String("version_patch"),
+    value = Int(patch)
+  }
+}
+\end{lstlisting}
+
+\field{digest} The digest NSM uses to calculate PCR hash values. Can be "SHA256", "SHA384" or "SHA512".
+\field{max_pcrs} The maximum number of PCRs that NSM supports. Typically 32.
+\field{module_id} The enclave identifier (e.g. i-1234-enc-5678)
+\field{locked_pcrs} Array of all PCRs that are in locked state
+\field{major} Major version of NSM (X in X.Y.Z)
+\field{minor} Minor version of NSM (Y in X.Y.Z)
+\field{patch} Patch version of NSM (Z in X.Y.Z)
+
+\subsubsection{Attestation}\label{sec:Device Types / NSM Device / Device Operations / Attestation}
+
+The driver requests an attestation document that contains the cryptographically
+signed state of the system. The device responds with an error or the document.
+
+\drivernormative{\paragraph}{Attestation}{Device Types / NSM Device / Device Operations / Attestation}
+
+The driver requests to receive an attestation document using the following message:
+\begin{lstlisting}
+Map(1) {
+  key = String("Attestation"),
+  value = Map(3) {
+    key = String("user_data"),
+    value = Array(),
+    key = String("nonce"),
+    value = Array(),
+    key = String("public_key"),
+    value = Array(),
+  }
+}
+\end{lstlisting}
+
+\field{user_data} Free form data that will be included in the signed document verbatim
+\field{nonce} A nonce value that will be included in the signed document
+\field{public_key} A public key value that will be included in the signed document
+
+\devicenormative{\paragraph}{Attestation}{Device Types / NSM Device / Device Operations / Attestation}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("Attestation"),
+  value = Map(1) {
+    key = String("document"),
+    value = Array(document)
+  }
+}
+\end{lstlisting}
+
+\field{document} The NSM provided attestation document
+
+\subsubsection{GetRandom}\label{sec:Device Types / NSM Device / Device Operations / GetRandom}
+
+The driver requests random data from the NSM device. The device responds with
+an error or success message.
+
+\drivernormative{\paragraph}{GetRandom}{Device Types / NSM Device / Device Operations / GetRandom}
+
+The driver requests random data using the following message:
+\begin{lstlisting}
+String("GetRandom")
+\end{lstlisting}
+
+\devicenormative{\paragraph}{GetRandom}{Device Types / NSM Device / Device Operations / GetRandom}
+
+The device MUST respond with an error message or with the following success message:
+
+\begin{lstlisting}
+Map(1) {
+  key = String("GetRandom"),
+  value = Map(1) {
+    key = String("random"),
+    value = Array(random)
+  }
+}
+\end{lstlisting}
+
+\field{random} Random data
\ No newline at end of file
diff --git a/device-types/nsm/device-conformance.tex b/device-types/nsm/device-conformance.tex
new file mode 100644
index 0000000..9f752d6
--- /dev/null
+++ b/device-types/nsm/device-conformance.tex
@@ -0,0 +1,13 @@
+\conformance{\subsection}{NSM Device Conformance}\label{sec:Conformance / Device Conformance / NSM Device Conformance}
+
+An NSM device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / DescribePCR}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / ExtendPCR}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / LockPCR}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / LockPCRs}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / DescribeNSM}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / Attestation}
+\item \ref{devicenormative:Device Types / NSM Device / Device Operations / GetRandom}
+\end{itemize}
\ No newline at end of file
diff --git a/device-types/nsm/driver-conformance.tex b/device-types/nsm/driver-conformance.tex
new file mode 100644
index 0000000..437b0c7
--- /dev/null
+++ b/device-types/nsm/driver-conformance.tex
@@ -0,0 +1,13 @@
+\conformance{\subsection}{NSM Driver Conformance}\label{sec:Conformance / Driver Conformance / NSM Driver Conformance}
+
+An NSM driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / DescribePCR}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / ExtendPCR}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / LockPCR}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / LockPCRs}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / DescribeNSM}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / Attestation}
+\item \ref{drivernormative:Device Types / NSM Device / Device Operations / GetRandom}
+\end{itemize}
-- 
2.40.1




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




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
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/


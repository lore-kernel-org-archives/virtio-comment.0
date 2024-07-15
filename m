Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC057D07D
	for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 19:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721070379; cv=none; b=HOO1XxkUGzk9y8dzzPmW1K6J7kRcnWommHcAg+wd0CHgHS1XxYLtYKmhJ/G8Dpb76myWhff0uI8PwUuF/60Hc8xqoYsXU+ni8ZMFCZo/2eLqu7MbQh3WxbQdbdYbGsYnbDURkuAGIt/k5OnHch1iPzJGiSEQOhrzBfL0xRpjwmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721070379; c=relaxed/simple;
	bh=bFCXYVY1OXrfqigsHtUySVtgkhxUZZ5sdV/zakWlUA8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I/xka0994GsgiKYVfPuhgNtA6XSFV+VEeYWllvtZDjGmGuRPbzrmHeXof8KHB/hNCKe1FMSRVrVwRGCpxnaWcLT2xaQ1QUMv3bPWBf+Tj2rHwOH+ZPyK7ZmtTL7UR9WPB86unlyoC6uTlzXz8B7pAxGG8nHZM+mZ1p9bETEfLhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw/Bckx7; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw/Bckx7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2eea7e2b0e6so62848421fa.3
        for <virtio-comment@lists.linux.dev>; Mon, 15 Jul 2024 12:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721070376; x=1721675176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/8P8cyGazQTwB7Zd6UyWYgovGLkoPLbX24Hsifb8wDU=;
        b=Pw/Bckx7QMLxtBWzpw0ymT1Bq2wVyJE32B3/Owz1ElYuj4ScXXa7U5s14zL+hfrM9G
         NhodK/45x/OXz3z0cxLPp6gX3tFb4UIjnPvArZj/jDekw6mSVSLWUFwPIJhuTQLfBeZ9
         Fnk6xO9qrGYiIcEZntcLnC2Bcy2lGDvoWKNFSrPyWUXUVnEEZyxeFfzKSqNaPcfUAF3d
         WYAJ6pUL885wLxgzGtoGX76cQ7FZd4t9mkKdL1msvma7cUxuxlusg7CqYSBfvQuRE6Br
         /BnkDeZMb4UFShC9Xz2tA9bYOiYjVEnjsjwAYqWtEHa8GvwaSV0MpNgo8+ms4PGG1aI/
         J+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721070376; x=1721675176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/8P8cyGazQTwB7Zd6UyWYgovGLkoPLbX24Hsifb8wDU=;
        b=Rwi+qgZf+0Xz/lipxT4DtJn5kHWl4hF5vc/RR27zYi0jWUAr6FeMPAhOwVZ6hHWy+M
         kv94xyymb0jq3GooiryXxejnfHoBCUXsbTPZJzs22C3VVEgOGqSlJegXzjGOp1biBg5m
         rBVhQnAPjAq21/GQCt+Eozp1PotR3aeZRMtoxrwXxS4eL3W0o+Q9bk+NXAZlFmtPnbVC
         gLutAmcE4EGdUmWDzB6k/pTyNJTsZbayQ5YD8rlne+wy2muZKA/rmynjVzN/8I+p7AkH
         whIjGOaRdl5xgRStmOig3p3UVqQZ6DFRFPcNMpc5iKV6ObnTCeDESiGUBckGhBjppvlG
         EAoQ==
X-Gm-Message-State: AOJu0Ywt7eoI67zSZ5/nALKGNZVGFuCO5zpr4QPyzR56RbsjXJIIoDvu
	AHn7zB0rxCGHwwJqmSnCzvvlqEUCDk8RxsG2rC3cdV/0juSZFMn23WNIOCVi514=
X-Google-Smtp-Source: AGHT+IFW4fqsAgubx5MyQAf6EP4wBvbyDnEIugt4H6wTN3v7vzGfeURVmPt4sORCniAx6ZyRfCq6xQ==
X-Received: by 2002:a2e:961a:0:b0:2ee:46ec:60bc with SMTP id 38308e7fff4ca-2eef419efc8mr260961fa.27.1721070363999;
        Mon, 15 Jul 2024 12:06:03 -0700 (PDT)
Received: from localhost.localdomain ([176.194.195.135])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1914dfcsm9575431fa.74.2024.07.15.12.06.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 15 Jul 2024 12:06:03 -0700 (PDT)
From: Mikhail Krasheninnikov <krashmisha@gmail.com>
To: virtio-comment@lists.linux.dev
Cc: Mikhail Krasheninnikov <krashmisha@gmail.com>,
	Matwey Kornilov <matwey.kornilov@gmail.com>
Subject: [PATCH] virtio-sdhci: add the device specification
Date: Mon, 15 Jul 2024 22:05:20 +0300
Message-Id: <20240715190520.36937-1-krashmisha@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virtio-sdhci is a virtual SDHCI (Secure Digital Host Controller Interface) device.
It allows the guest to work with virtualized SD/MMC cards.

This patch adds the specification for virtio-sdhci.

Signed-off-by: Mikhail Krasheninnikov <krashmisha@gmail.com>
CC: Matwey Kornilov <matwey.kornilov@gmail.com>
---
 conformance.tex                           |  12 +-
 content.tex                               |   3 +
 device-types/sdhci/description.tex        | 216 ++++++++++++++++++++++
 device-types/sdhci/device-conformance.tex |   8 +
 device-types/sdhci/driver-conformance.tex |   8 +
 5 files changed, 243 insertions(+), 4 deletions(-)
 create mode 100644 device-types/sdhci/description.tex
 create mode 100644 device-types/sdhci/device-conformance.tex
 create mode 100644 device-types/sdhci/driver-conformance.tex

diff --git a/conformance.tex b/conformance.tex
index 183c059..a268dda 100644
--- a/conformance.tex
+++ b/conformance.tex
@@ -34,8 +34,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Driver Conformance / SCMI Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / GPIO Driver Conformance},
 \ref{sec:Conformance / Driver Conformance / PMEM Driver Conformance},
-\ref{sec:Conformance / Driver Conformance / CAN Driver Conformance} or
-\ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance}.
+\ref{sec:Conformance / Driver Conformance / CAN Driver Conformance},
+\ref{sec:Conformance / Driver Conformance / SPI Controller Driver Conformance} or
+\ref{sec:Conformance / Driver Conformance / SDHCI Driver Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -63,8 +64,9 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \ref{sec:Conformance / Device Conformance / SCMI Device Conformance},
 \ref{sec:Conformance / Device Conformance / GPIO Device Conformance},
 \ref{sec:Conformance / Device Conformance / PMEM Device Conformance},
-\ref{sec:Conformance / Device Conformance / CAN Device Conformance} or
-\ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance}.
+\ref{sec:Conformance / Device Conformance / CAN Device Conformance},
+\ref{sec:Conformance / Device Conformance / SPI Controller Device Conformance} or
+\ref{sec:Conformance / Device Conformance / SDHCI Driver Conformance}.
 
     \item Clause \ref{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}.
   \end{itemize}
@@ -159,6 +161,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/driver-conformance.tex}
 \input{device-types/can/driver-conformance.tex}
 \input{device-types/spi/driver-conformance.tex}
+\input{device-types/sdhci/driver-conformance.tex}
 
 \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
 
@@ -248,6 +251,7 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
 \input{device-types/pmem/device-conformance.tex}
 \input{device-types/can/device-conformance.tex}
 \input{device-types/spi/device-conformance.tex}
+\input{device-types/sdhci/device-conformance.tex}
 
 \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
 A conformant implementation MUST be either transitional or
diff --git a/content.tex b/content.tex
index d7d544e..56d5c0c 100644
--- a/content.tex
+++ b/content.tex
@@ -743,6 +743,8 @@ \chapter{Device Types}\label{sec:Device Types}
 \hline
 47         &   CPU balloon device \\
 \hline
+48         &   SDHCI device \\
+\hline
 \end{longtable}
 
 Some of the devices above are unspecified by this document,
@@ -773,6 +775,7 @@ \chapter{Device Types}\label{sec:Device Types}
 \input{device-types/pmem/description.tex}
 \input{device-types/can/description.tex}
 \input{device-types/spi/description.tex}
+\input{device-types/sdhci/description.tex}
 
 \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
 
diff --git a/device-types/sdhci/description.tex b/device-types/sdhci/description.tex
new file mode 100644
index 0000000..425f444
--- /dev/null
+++ b/device-types/sdhci/description.tex
@@ -0,0 +1,216 @@
+\section{SDHCI Device}\label{sec:Device Types / SDHCI Device}
+
+The virtio SDHCI (SD Host Controller Interface) driver provides
+a virtualized interface for MMC/SD card devices in guest systems.
+This driver emulates the functionality of a physical SDHCI controller,
+enabling guest operating systems to interact with virtual MMC/SD
+storage as if they were physical devices.
+
+\subsection{Device ID}\label{sec:Device Types / SDHCI Device / Device ID}
+  48
+
+\subsection{Virtqueues}\label{sec:Device Types / SDHCI Device / Virtqueues}
+\begin{description}
+\item[0] requestq
+\end{description}
+
+\subsection{Feature bits}\label{sec:Device Types / SDHCI Device / Feature bits}
+
+None currently defined.
+
+\subsection{Device configuration layout}\label{sec:Device Types / SDHCI Device / Device configuration layout}
+
+None currently defined.
+
+\subsection{Device Initialization}\label{sec:Device Types / SDHCI Device / Device Initialization}
+
+\begin{enumerate}
+\item The virtqueue is initialized
+\end{enumerate}
+
+\subsection{Driver Operation}\label{sec:Device Types / SDHCI Device / Driver Operation}
+
+The driver enqueues requests to the virtqueues, and they are processed
+by the device. Each MMC request is of the form:
+
+\begin{lstlisting}
+struct virtio_mmc_request {
+        u8 flags;
+
+        struct mmc_req request;
+
+        u8 buf[4096];
+        le32 buf_len;
+
+        struct mmc_req stop_req;
+        struct mmc_req sbc_req;
+};
+\end{lstlisting}
+
+The \field{flags} field indicates the type of MMC request. The following flags are defined:
+
+\begin{lstlisting}
+#define VIRTIO_MMC_REQUEST_DATA  BIT(1)
+#define VIRTIO_MMC_REQUEST_WRITE BIT(2)
+#define VIRTIO_MMC_REQUEST_STOP  BIT(3)
+#define VIRTIO_MMC_REQUEST_SBC   BIT(4)
+\end{lstlisting}
+
+\begin{itemize}
+\item VIRTIO_MMC_REQUEST_DATA (BIT(1)): Indicates that the request includes a data phase.
+\item VIRTIO_MMC_REQUEST_WRITE (BIT(2)): Indicates a write operation.
+\item VIRTIO_MMC_REQUEST_STOP (BIT(3)): Indicates a stop command.
+\item VIRTIO_MMC_REQUEST_SBC (BIT(4)): Indicates a Set Block Count (SBC) command.
+\end{itemize}
+
+The \field{request} field is a structure of type \field{mmc_req} representing the primary MMC command:
+
+\begin{lstlisting}
+struct mmc_req {
+        le32 opcode;
+        le32 arg;
+};
+\end{lstlisting}
+
+\begin{itemize}
+        \item \field{opcode}: A 32-bit little-endian value representing the MMC command opcode.
+        \item \field{arg}: A 32-bit little-endian value representing the argument to the MMC command.
+\end{itemize}
+
+The \field{buf} field is a 4096-byte buffer used for data transfer, and \field{buf_len}
+is a 32-bit little-endian value specifying the length of the data in buf.
+
+The \field{stop_req} field is an optional \field{mmc_req} structure used if the request
+includes a stop command, and \field{sbc_req} is an optional \field{mmc_req} structure
+used if the request includes an SBC command.
+
+\drivernormative{\subsubsection}{Device Operation}{Device Types / SDHCI Device / Device Operation}
+
+The driver SHOULD verify the content of the flags field for validity before submitting a request.
+
+A driver MUST NOT submit a request with the buf_len field exceeding 4096 bytes.
+
+A driver MUST set the buf_len field to 0 for requests without the VIRTIO_MMC_REQUEST_DATA flag.
+
+A driver MUST set the buf field to contain valid data for write operations, indicated by
+the VIRTIO_MMC_REQUEST_WRITE flag.
+
+A driver SHOULD ensure the opcode and arg fields in mmc_req structures are correctly set
+according to the MMC command specification.
+
+For a request with the VIRTIO_MMC_REQUEST_STOP flag, the stop_req field MUST be populated
+with a valid stop command.
+
+For a request with the VIRTIO_MMC_REQUEST_SBC flag, the sbc_req field MUST be populated
+with a valid Set Block Count (SBC) command.
+
+The length of data in the buf field MUST be a multiple of the block size for read and write
+operations.
+
+A driver MUST ensure that opcode and arg values comply with the MMC command set and do not
+cause undefined behavior.
+
+The flags field MUST be set correctly to reflect the intended operation (data transfer, write,
+stop, SBC).
+
+The request, stop_req, and sbc_req fields MUST be set to valid mmc_req structures appropriate
+for the MMC commands being issued.
+
+The driver SHOULD handle errors returned by the device and take appropriate action based on
+the status of the request.
+
+The driver SHOULD verify the content of the cmd_resp field upon receiving a response.
+
+A driver MUST handle the cmd_resp_len field correctly, ensuring it processes only the valid
+part of the command response.
+
+A driver SHOULD use the data in the buf field if the request was a read operation.
+
+A driver MUST handle errors indicated by the command response and take appropriate action.
+
+A driver SHOULD validate the length and content of the cmd_resp field according to the MMC
+command specification.
+
+A driver MUST ensure that the buf field is processed correctly and data integrity is maintained.
+
+The driver SHOULD log any errors or anomalies found in the response for debugging and maintenance
+purposes.
+
+\subsection{Device Operation}\label{sec:Device Types / SDHCI Device / Device Operation}
+
+Each response from the device is of the following form:
+
+\begin{lstlisting}
+struct virtio_mmc_response {
+        __le32 cmd_resp[4];
+        uint8_t cmd_resp_len;
+        uint8_t buf[4096];
+};
+\end{lstlisting}
+
+\begin{itemize}
+        \item \field{cmd_resp}: An array of four 32-bit little-endian values representing the
+        command response from the MMC device.
+        \item \field{cmd_resp_len}: An 8-bit value indicating the length of the command response.
+        \item \field{buf}: A 4096-byte buffer for data transfer from the device to the driver.
+\end{itemize}
+
+\devicenormative{\subsubsection}{Device Operation}{Device Types / SDHCI Device / Device Operation}
+
+The device SHOULD verify the content of the flags field for validity before processing a request.
+
+A device MUST NOT process a request if the buf_len field exceeds 4096 bytes.
+
+A device MUST ignore the buf field for requests without the VIRTIO_MMC_REQUEST_DATA flag.
+
+A device MUST use the buf field data for write operations, indicated by the
+VIRTIO_MMC_REQUEST_WRITE flag.
+
+A device MUST validate the opcode and arg fields in mmc_req structures according to
+the MMC command specification.
+
+For a request with the VIRTIO_MMC_REQUEST_STOP flag, the stop_req field MUST be used
+to process a valid stop command.
+
+For a request with the VIRTIO_MMC_REQUEST_SBC flag, the sbc_req field MUST be used to
+process a valid Set Block Count (SBC) command.
+
+The length of data in the buf field MUST be a multiple of the block size for read and
+write operations.
+
+The device SHOULD handle configuration change notifications and adjust its behavior accordingly.
+
+A device MUST ensure that opcode and arg values comply with the MMC command set and
+do not cause undefined behavior.
+
+The flags field MUST be processed correctly to reflect the intended operation (data
+transfer, write, stop, SBC).
+
+The request, stop_req, and sbc_req fields MUST be validated as mmc_req structures
+appropriate for the MMC commands being issued.
+
+The device SHOULD report errors to the driver and provide appropriate status for
+the request.
+
+The device MUST ensure data integrity and correctness when processing read and write operations.
+
+The device SHOULD log and handle invalid requests gracefully, without causing a crash
+or undefined behavior.
+
+The device MUST populate the cmd_resp field with valid command response values
+according to the MMC specification.
+
+The device MUST set the cmd_resp_len field to indicate the length of the command response.
+
+For read operations, the device MUST populate the buf field with the requested data.
+
+The device SHOULD handle errors internally and populate the cmd_resp field with
+appropriate error codes.
+
+The device MUST ensure that the length of the command response does not exceed
+the maximum allowed by cmd_resp_len.
+
+The device MUST maintain data integrity and correctness when writing to the buf field.
+
+The device SHOULD log and handle invalid responses gracefully, without causing a crash
+or undefined behavior.
\ No newline at end of file
diff --git a/device-types/sdhci/device-conformance.tex b/device-types/sdhci/device-conformance.tex
new file mode 100644
index 0000000..cc12806
--- /dev/null
+++ b/device-types/sdhci/device-conformance.tex
@@ -0,0 +1,8 @@
+\conformance{\subsection}{SDHCI Device Conformance}\label{sec:Conformance / Device Conformance / SDHCI Device Conformance}
+
+A SDHCI device MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{devicenormative:Device Types / SDHCI Device / Device Initialization}
+\item \ref{devicenormative:Device Types / SDHCI Device / Device Operation}
+\end{itemize}
diff --git a/device-types/sdhci/driver-conformance.tex b/device-types/sdhci/driver-conformance.tex
new file mode 100644
index 0000000..47cd855
--- /dev/null
+++ b/device-types/sdhci/driver-conformance.tex
@@ -0,0 +1,8 @@
+\conformance{\subsection}{SDHCI Driver Conformance}\label{sec:Conformance / Driver Conformance / SDHCI Driver Conformance}
+
+A SDHCI driver MUST conform to the following normative statements:
+
+\begin{itemize}
+\item \ref{drivernormative:Device Types / SDHCI Device / Device Initialization}
+\item \ref{drivernormative:Device Types / SDHCI Device / Device Operation}
+\end{itemize}
-- 
2.39.3 (Apple Git-146)


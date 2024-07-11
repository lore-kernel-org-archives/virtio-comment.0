Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2136C12F385
	for <virtio-comment@lists.linux.dev>; Thu, 11 Jul 2024 06:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720681171; cv=none; b=UcXzvSQhilQlTHi81EmyHmZTFHwd60S2B1cy1xSs+wi3gXEYVxVgSlYDgM32BWIVsfd2g3uj0AgMXVIe29YCj2eLYeiwJu8TtlHv2HNhp4J5MjqI/LNB7cgzjKVnMMwn4NtlQXKIInM0ocGc7QffpzzjUJuRAsNxisBckyje6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720681171; c=relaxed/simple;
	bh=1PNlGsbUfm2kj0yTqPidqj2TPJwCSL+W7hSimd3HAdc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VkBg2OT8bpInyVodNRNZ/FkAWeHQECR5BTb3c1lw5i0pitgt87zdxWviWtkqg/pSCX4CX163+GiFwptl50eingMqUNAVHq+ZtYUgt72n3AweBJV5LXyO318qvc+u68KPCGv4jDVIMML4FTVwXd28QnTX2O9Ak0zebCWoc2CFFm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EdKNMmqw; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EdKNMmqw"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7f99d50c1a6so33690539f.0
        for <virtio-comment@lists.linux.dev>; Wed, 10 Jul 2024 23:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720681168; x=1721285968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IFKkJ/p3mslCJi3y3pYVmIQOwiI+QNCbe/VWlv0GQbQ=;
        b=EdKNMmqw3cuGPOfHlaIKrNazHI0cOFUJ0cD6x8YFaeGdLiw28p97wLCFm1AdeQ/67f
         1pQ6Z+kMeJIR4oPMHCbW27G4D3dX80Ip/LhjAHhHx31v5C4zENnm01u1MCO6uWzZDur4
         EcVja2rribrZJ2lUDwdhaxn/9WZ6DAefqPvMV9zN9aUeCVRI9jR2qjFHpgyvop4usPHE
         l1XWZsZeitJwmjxdehNuBhdvXVOznJr4s+CkN/1bAcOChlAdGzcLzdFJHF4UXy+0aQ2Y
         xjEH4JncjSg6FfhL34hHA/LxvGT05iOWH1XpAKWULIUnBC65u8XZHs9sgDfXsl1+Rcs/
         9GAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720681168; x=1721285968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IFKkJ/p3mslCJi3y3pYVmIQOwiI+QNCbe/VWlv0GQbQ=;
        b=itGJDx+Ku3OwJDyg+kfieFegu0a5+HnrvR78ypJ+sc3hG/bDZu18t39oatzNaxounl
         ulfdVi5wjefZTb7muFInlP+gtDAxM01vkpNuoAdthXhKzb8rI2TO9jPYftcej5dEoB6Z
         GN9GNlPWKcQrD3AKLQRVM81d12y7qrOXajRGlbXAf7nrffmkyHaRxPFpEoChvusxZem6
         58MiR6leDZMs1ZBEj8UIO8umrNd97PhGc9dSLQ2WOmShMIw0/3hYm4Ybk0tqb/+o4ZNN
         D73pIs8g6YgNEcOBDZi/+mNQwzTjCFMwMhsmw6eOVTMBIjpEoargaI+loMOjREXHrRqO
         lLLg==
X-Gm-Message-State: AOJu0Yx1/wLksN1mY93kpLs5YMTeoBYkbwocnU9wBZy4mXxTKrm8fuRn
	q56E30WHHlgMaSXB8Orn53ppDy0XOIdbCSh3L8QpLJ9fXchzKB2JWCqtE758bxp9yIBYsy3a/yY
	=
X-Google-Smtp-Source: AGHT+IFD0jMVAeDUPUxDoZfVHdgKvrfVuSXPCiWV9MBqd6FTFPPbF4eogiGxCIGppjJbMb2qzXgj/w==
X-Received: by 2002:a05:6e02:1c4a:b0:383:873c:e2a4 with SMTP id e9e14a558f8ab-38a57dc20camr92835045ab.18.1720681168051;
        Wed, 10 Jul 2024 23:59:28 -0700 (PDT)
Received: from localhost.localdomain ([117.193.208.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d607d5ea3sm3872999a12.24.2024.07.10.23.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 23:59:27 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] transport-pci: Add MSI support
Date: Thu, 11 Jul 2024 12:29:19 +0530
Message-Id: <20240711065919.6977-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MSI is the predecessor of MSI-X that allows PCIe devices to send interrupts
to the host. Compared to MSI-X, MSI supports only a maximum of 32 vectors
per PCIe function. But MSI has been widely supported by the PCIe devices
requiring fewer interrupts such as Modems, WLAN cards etc...

Currently, Virtio spec only documents MSI-X and INTX interrupt mechanisms
for the PCI transport. So if a Virtio device based on PCI transport
supports only MSI, then the driver on the guest will only use INTX for
receiving the interrupts. This is really sub-optimal and affects the
performance of the device. Because with MSI, the device can use one vector
per queue (max of 32 vectors) thus avoiding the overhead associated with a
shared INTX vector.

Hence, add support for MSI to the Virtio PCI transport. MSI support is
added such a way that it reuses the existing infrastructure of MSI-X, like
the config_msix_vector/queue_msix_vector fields of the Virito common config
structure. This makes it easy for the Virtio drivers to add MSI support
without any disruptive changes.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 transport-pci.tex | 125 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 97 insertions(+), 28 deletions(-)

diff --git a/transport-pci.tex b/transport-pci.tex
index a5c6719..f8e6ccd 100644
--- a/transport-pci.tex
+++ b/transport-pci.tex
@@ -347,7 +347,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         Driver Feature Bits selected by \field{driver_feature_select}.
 
 \item[\field{config_msix_vector}]
-        Set by the driver to the MSI-X vector for configuration change notifications.
+        Set by the driver to the MSI/MSI-X vector for configuration change notifications.
 
 \item[\field{num_queues}]
         The device specifies the maximum number of virtqueues supported here.
@@ -371,7 +371,7 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
         A 0 means the queue is unavailable.
 
 \item[\field{queue_msix_vector}]
-        Set by the driver to the MSI-X vector for virtqueue notifications.
+        Set by the driver to the MSI/MSI-X vector for virtqueue notifications.
 
 \item[\field{queue_enable}]
         The driver uses this to selectively prevent the device from executing requests from this virtqueue.
@@ -631,11 +631,11 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
 in \field{ISR status} before sending a device configuration
 change notification to the driver.
 
-If MSI-X capability is disabled, the device MUST set the Queue
+If MSI/MSI-X capability is disabled, the device MUST set the Queue
 Interrupt bit in \field{ISR status} before sending a virtqueue
 notification to the driver.
 
-If MSI-X capability is disabled, the device MUST set the Interrupt Status
+If MSI/MSI-X capability is disabled, the device MUST set the Interrupt Status
 bit in the PCI Status register in the PCI Configuration Header of
 the device to the logical OR of all bits in \field{ISR status} of
 the device.  The device then asserts/deasserts INT\#x interrupts unless masked
@@ -645,7 +645,7 @@ \subsubsection{ISR status capability}\label{sec:Virtio Transport Options / Virti
 
 \drivernormative{\paragraph}{ISR status capability}{Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / ISR status capability}
 
-If MSI-X capability is enabled, the driver SHOULD NOT access
+If MSI/MSI-X capability is enabled, the driver SHOULD NOT access
 \field{ISR status} upon detecting a Queue Interrupt.
 
 \subsubsection{Device-specific configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI Device Layout / Device-specific configuration}
@@ -838,7 +838,7 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
 \hline
 \end{tabularx}
 
-If MSI-X is enabled for the device, two additional fields
+If MSI/MSI-X is enabled for the device, two additional fields
 immediately follow this header:
 
 \begin{tabular}{ |l||l|l| }
@@ -847,14 +847,14 @@ \subsubsection{Legacy Interfaces: A Note on PCI Device Layout}\label{sec:Virtio
 \hline
 Read/Write & R+W            & R+W    \\
 \hline
-Purpose (MSI-X) & \field{config_msix_vector}  & \field{queue_msix_vector} \\
+Purpose (MSI/MSI-X) & \field{config_msix_vector}  & \field{queue_msix_vector} \\
 \hline
 \end{tabular}
 
-Note: When MSI-X capability is enabled, device-specific configuration starts at
-byte offset 24 in virtio common configuration structure. When MSI-X capability is not
+Note: When MSI/MSI-X capability is enabled, device-specific configuration starts at
+byte offset 24 in virtio common configuration structure. When MSI/MSI-X capability is not
 enabled, device-specific configuration starts at byte offset 20 in virtio
-header.  ie. once you enable MSI-X on the device, the other fields move.
+header.  ie. once you enable MSI/MSI-X on the device, the other fields move.
 If you turn it off again, they move back!
 
 Any device-specific configuration space immediately follows
@@ -1017,7 +1017,7 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
 \drivernormative{\subparagraph}{MSI-X Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI-X Vector Configuration}
 
 Driver MUST support device with any MSI-X Table Size 0 to 0x7FF.
-Driver MAY fall back on using INT\#x interrupts for a device
+Driver MAY fall back on using MSI or INT\#x interrupts for a device
 which only supports one MSI-X vector (MSI-X Table Size = 0).
 
 Driver MAY interpret the Table Size as a hint from the device
@@ -1034,6 +1034,75 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
 the driver MAY retry mapping with fewer vectors, disable MSI-X
 or report device failure.
 
+\paragraph{MSI Vector Configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
+
+When MSI capability is present and enabled in the device
+(through standard PCI configuration space) \field{config_msix_vector} and \field{queue_msix_vector} are used to map configuration change and queue
+interrupts to MSI vectors. In this case, the ISR Status is unused.
+
+Writing a valid MSI vector number, 0 to 0x1F, to
+\field{config_msix_vector}/\field{queue_msix_vector} maps interrupts triggered
+by the configuration change/selected queue events respectively to
+the corresponding MSI vector. To disable interrupts for an
+event type, the driver unmaps this event by writing a special NO_VECTOR
+value:
+
+\begin{lstlisting}
+/* Vector value used to disable MSI for queue */
+#define VIRTIO_MSI_NO_VECTOR            0xffff
+\end{lstlisting}
+
+Note that mapping an event to vector might require device to
+allocate internal device resources, and thus could fail.
+
+\devicenormative{\subparagraph}{MSI Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
+
+A device that has an MSI capability SHOULD support at least 2
+and at most 0x20 MSI vectors.
+Device MUST report the number of vectors supported in
+\field{Multiple Message Capable} field in the MSI Capability as specified in
+\hyperref[intro:PCI]{[PCI]}.
+The device SHOULD restrict the reported MSI Multiple Message Capable field
+to a value that might benefit system performance.
+\begin{note}
+For example, a device which does not expect to send
+interrupts at a high rate might only specify 2 MSI vectors.
+\end{note}
+Device MUST support mapping any event type to any valid
+vector 0 to number of MSI vectors specified in \field{Multiple Message Capable} field.
+Device MUST support unmapping any event type.
+
+The device MUST return vector mapped to a given event,
+(NO_VECTOR if unmapped) on read of \field{config_msix_vector}/\field{queue_msix_vector}.
+The device MUST have all queue and configuration change
+events unmapped upon reset.
+
+Devices SHOULD NOT cause mapping an event to vector to fail
+unless it is impossible for the device to satisfy the mapping
+request.  Devices MUST report mapping
+failures by returning the NO_VECTOR value when the relevant
+\field{config_msix_vector}/\field{queue_msix_vector} field is read.
+
+\drivernormative{\subparagraph}{MSI Vector Configuration}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / MSI Vector Configuration}
+
+Driver MUST support device with any MSI vector from 0 to 0x1F.
+Driver MAY fall back on using INT\#x interrupts for a device
+which only supports one MSI vector (MSI Multiple Message Capable = 0).
+
+Driver MAY interpret the Multiple Message Capable field as a hint from the device
+for the suggested number of MSI vectors to use.
+
+Driver MUST NOT attempt to map an event to a vector
+outside the MSI vector supported by the device,
+as reported by \field{Multiple Message Capable} field in the MSI Capability.
+
+After mapping an event to vector, the
+driver MUST verify success by reading the Vector field value: on
+success, the previously written value is returned, and on
+failure, NO_VECTOR is returned. If a mapping failure is detected,
+the driver MAY retry mapping with fewer vectors, disable MSI
+or report device failure.
+
 \paragraph{Virtqueue Configuration}\label{sec:Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Device Initialization / Virtqueue Configuration}
 
 As a device can have zero or more virtqueues for bulk data
@@ -1054,10 +1123,10 @@ \subsubsection{Device Initialization}\label{sec:Virtio Transport Options / Virti
 \item Allocate and zero Descriptor Table, Available and Used rings for the
    virtqueue in contiguous physical memory.
 
-\item Optionally, if MSI-X capability is present and enabled on the
+\item Optionally, if MSI/MSI-X capability is present and enabled on the
   device, select a vector to use to request interrupts triggered
-  by virtqueue events. Write the MSI-X Table entry number
-  corresponding to this vector into \field{queue_msix_vector}. Read
+  by virtqueue events. Write the MSI-X Table entry number or MSI vector number
+  corresponding to this event into \field{queue_msix_vector}. Read
   \field{queue_msix_vector}: on success, previously written value is
   returned; on failure, NO_VECTOR value is returned.
 \end{enumerate}
@@ -1129,25 +1198,25 @@ \subsubsection{Used Buffer Notifications}\label{sec:Virtio Transport Options / V
 If a used buffer notification is necessary for a virtqueue, the device would typically act as follows:
 
 \begin{itemize}
-  \item If MSI-X capability is disabled:
+  \item If MSI/MSI-X capability is disabled:
     \begin{enumerate}
     \item Set the lower bit of the ISR Status field for the device.
 
     \item Send the appropriate PCI interrupt for the device.
     \end{enumerate}
 
-  \item If MSI-X capability is enabled:
+  \item If MSI/MSI-X capability is enabled:
     \begin{enumerate}
     \item If \field{queue_msix_vector} is not NO_VECTOR,
-      request the appropriate MSI-X interrupt message for the
+      request the appropriate MSI/MSI-X interrupt message for the
       device, \field{queue_msix_vector} sets the MSI-X Table entry
-      number.
+      number or MSI vector number.
     \end{enumerate}
 \end{itemize}
 
 \devicenormative{\paragraph}{Used Buffer Notifications}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Used Buffer Notifications}
 
-If MSI-X capability is enabled and \field{queue_msix_vector} is
+If MSI/MSI-X capability is enabled and \field{queue_msix_vector} is
 NO_VECTOR for a virtqueue, the device MUST NOT deliver an interrupt
 for that virtqueue.
 
@@ -1157,19 +1226,19 @@ \subsubsection{Notification of Device Configuration Changes}\label{sec:Virtio Tr
 state, as reflected in the device-specific configuration region of the device. In this case:
 
 \begin{itemize}
-  \item If MSI-X capability is disabled:
+  \item If MSI/MSI-X capability is disabled:
     \begin{enumerate}
     \item Set the second lower bit of the ISR Status field for the device.
 
     \item Send the appropriate PCI interrupt for the device.
     \end{enumerate}
 
-  \item If MSI-X capability is enabled:
+  \item If MSI/MSI-X capability is enabled:
     \begin{enumerate}
     \item If \field{config_msix_vector} is not NO_VECTOR,
-      request the appropriate MSI-X interrupt message for the
+      request the appropriate MSI/MSI-X interrupt message for the
       device, \field{config_msix_vector} sets the MSI-X Table entry
-      number.
+      number or MSI vector number.
     \end{enumerate}
 \end{itemize}
 
@@ -1178,7 +1247,7 @@ \subsubsection{Notification of Device Configuration Changes}\label{sec:Virtio Tr
 
 \devicenormative{\paragraph}{Notification of Device Configuration Changes}{Virtio Transport Options / Virtio Over PCI Bus / PCI-specific Initialization And Device Operation / Notification of Device Configuration Changes}
 
-If MSI-X capability is enabled and \field{config_msix_vector} is
+If MSI/MSI-X capability is enabled and \field{config_msix_vector} is
 NO_VECTOR, the device MUST NOT deliver an interrupt
 for device configuration space changes.
 
@@ -1191,7 +1260,7 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
 The driver interrupt handler would typically:
 
 \begin{itemize}
-  \item If MSI-X capability is disabled:
+  \item If MSI/MSI-X capability is disabled:
     \begin{itemize}
       \item Read the ISR Status field, which will reset it to zero.
       \item If the lower bit is set:
@@ -1201,14 +1270,14 @@ \subsubsection{Driver Handling Interrupts}\label{sec:Virtio Transport Options /
       \item If the second lower bit is set:
         re-examine the configuration space to see what changed.
     \end{itemize}
-  \item If MSI-X capability is enabled:
+  \item If MSI/MSI-X capability is enabled:
     \begin{itemize}
       \item
-        Look through all virtqueues mapped to that MSI-X vector for the
+        Look through all virtqueues mapped to that MSI/MSI-X vector for the
         device, to see if any progress has been made by the device
         which requires servicing.
       \item
-        If the MSI-X vector is equal to \field{config_msix_vector},
+        If the MSI/MSI-X vector is equal to \field{config_msix_vector},
         re-examine the configuration space to see what changed.
     \end{itemize}
 \end{itemize}
-- 
2.25.1


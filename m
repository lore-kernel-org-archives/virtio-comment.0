Return-Path: <virtio-comment-return-5032-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28130C6FD1C
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Mar 2023 09:11:07 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 66A862CAD8
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Mar 2023 09:11:06 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5D93298648B
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Mar 2023 09:11:06 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53F13984285; Fri, 24 Mar 2023 09:11:06 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 448AE986399
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Mar 2023 09:11:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: CpN8REN3MFmmEodWTHZhdA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679649056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgmfDr35n/lLfdJozipVO8XujxvF4V6VnUga4v4IMO0=;
        b=z1X7xCO9jYMguOXOAen8Gums27aZFN64KsSJZYQahsgPJF/peJ200EliAtenfGJPLc
         hOSySmvHlSoVC6elI5UVrefTM7LihI/jbl61GNUNiLW2+V6hTYp+sKlxYkL61O1Vo5Ny
         WieGFJLgvb5us/Gt8AF5JOwaJf1aVi73I7UnCBnxM0SvzBAphnix886pGwXcNBDCIOTI
         cx5F36oHQdJNfVmguOyooAoaIqZyYe4ny0Uh3jscGgXDcmmqSKGyCsnmeHeaD/V0HFQz
         YnhLTB1rninhgCBtvNoQcaTzVlIkVISdE3WQuGXPnl1cM1UVXfNiVNnds1no3IJyIzVW
         VzoA==
X-Gm-Message-State: AAQBX9f3+gLc+qFTL7+xI8rWPRgdJKJd5h2i53NpYZWRRPn6o0OoQqck
	et4EEKW/cb5KVU+rCPE2JHDh8iO7vqYVGEViTNysA0UU0C2v8bkfaQyk/dl3zRAVe9EFlYxihPa
	QALWE6kvPGCg47OpglEkc6LordAWlJ1EbKg==
X-Received: by 2002:a5d:4b44:0:b0:2cd:bc79:5444 with SMTP id w4-20020a5d4b44000000b002cdbc795444mr1438892wrs.2.1679649056440;
        Fri, 24 Mar 2023 02:10:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350biZhDWMG1Mns8Yl4XGWngimfw0H6galPKcAUnBzR5TdRYYV38S2pzpxb8t6cYd34q2btnE9g==
X-Received: by 2002:a5d:4b44:0:b0:2cd:bc79:5444 with SMTP id w4-20020a5d4b44000000b002cdbc795444mr1438852wrs.2.1679649056039;
        Fri, 24 Mar 2023 02:10:56 -0700 (PDT)
Date: Fri, 24 Mar 2023 05:10:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtio-comment@lists.oasis-open.org, hans@linux.alibaba.com,
	herongguang@linux.alibaba.com, zmlcc@linux.alibaba.com,
	dust.li@linux.alibaba.com, tonylu@linux.alibaba.com,
	zhenzao@linux.alibaba.com, helinguo@linux.alibaba.com,
	gerry@linux.alibaba.com, cohuck@redhat.com, jasowang@redhat.com,
	Jan Kiszka <jan.kiszka@siemens.com>, wintera@linux.ibm.com,
	kgraul@linux.ibm.com, wenjia@linux.ibm.com, jaka@linux.ibm.com,
	hca@linux.ibm.com, twinkler@linux.ibm.com, raspl@linux.ibm.com,
	virtio-dev@lists.oasis-open.org, pasic@linux.ibm.com
Message-ID: <20230324050752-mutt-send-email-mst@kernel.org>
References: <20230209033056.96657-1-xuanzhuo@linux.alibaba.com>
 <20230209033056.96657-2-xuanzhuo@linux.alibaba.com>
 <6ecabec0-0a17-f64a-b91c-115d65338bf2@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <6ecabec0-0a17-f64a-b91c-115d65338bf2@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v3 1/1] virtio-ism: introduce new device
 virtio-ism

On Fri, Mar 24, 2023 at 12:51:13AM -0400, Parav Pandit wrote:
> 
> 
> On 2/8/2023 10:30 PM, Xuan Zhuo wrote:
> > An ISM(Internal Shared Memory) device provides the ability to access memory
> > shared between multiple devices. This allows low-overhead communication in
> > presence of such memory. For example, memory can be shared with guests of
> > multiple virtual machines running on the same host, with each virtual machine
> 
> I am still learning this new memory sharing beast, so mostly cosmetics
> comments below.
> 
> instead of guest of virtual machines is confusing.
> It can be just written as - can be shared between virtual machines running
> on same host ..
> > including an ism device and with the guests getting the shared memory by the ism
> > devices.
> > 
> > An ism device can communicate with multiple peers simultaneously. This
> > communication can be dynamically started and ended.
> > 
> multiple peers mean, multiple peer ism device?
> Or you meant multiple vms?
> 
> > |-------------------------------------------------------------------------------------------------------------|
> > | |------------------------------------------------|       |------------------------------------------------| |
> > | | Guest                                          |       | Guest                                          | |
> > | |                                                |       |                                                | |
> instead of guest, naming it VM makes it consistent with the spec and
> description.

Ideally we just talk about drivers. But it's just a commit log,
it does not matter.

If you are talking about software that runs then calling it VM
is wrong - VM is the interface between guest software and hypervisor.


> > | |   ----------------                             |       |   ----------------                             | |
> > | |   |    driver    |     [M1]   [M2]   [M3]      |       |   |    driver    |             [M2]   [M3]     | |
> > | |   ----------------       |      |      |       |       |   ----------------               |      |      | |
> > | |    |cq|                  |map   |map   |map    |       |    |cq|                          |map   |map   | |
> > | |    |  |                  |      |      |       |       |    |  |                          |      |      | |
> > | |    |  |                -------------------     |       |    |  |                --------------------    | |
> > | |----|--|----------------|  device memory  |-----|       |----|--|----------------|  device memory   |----| |
> > | |    |  |                -------------------     |       |    |  |                --------------------    | |
> > | |                                |               |       |                               |                | |
> > | |                                |               |       |                               |                | |
> > | | Qemu                           |               |       | Qemu                          |                | |
> > | |--------------------------------+---------------|       |-------------------------------+----------------| |
> > |                                  |                                                       |                  |
> > |                                  |                                                       |                  |
> > |                                  |------------------------------+------------------------|                  |
> > |                                                                 |                                           |
> > |                                                                 |                                           |
> > |                                                   --------------------------                                |
> > |                                                    | M1 |   | M2 |   | M3 |                                 |
> > |                                                   --------------------------                                |
> > |                                                                                                             |
> > | HOST                                                                                                        |
> > ---------------------------------------------------------------------------------------------------------------
> > 
> You might want to show the event q as well next to control q as its so
> fundamental for this whole operation.
> 
> > ---
> >   conformance.tex |  26 +++
> >   content.tex     |   1 +
> >   virtio-ism.tex  | 573 ++++++++++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 600 insertions(+)
> >   create mode 100644 virtio-ism.tex
> > 
> > diff --git a/conformance.tex b/conformance.tex
> > index c3c1d3e..0a1456a 100644
> > --- a/conformance.tex
> > +++ b/conformance.tex
> > @@ -335,6 +335,17 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >   \item \ref{drivernormative:Device Types / PMEM Device / Device Initialization}
> >   \end{itemize}
> > +\conformance{\subsection}{ISM Driver Conformance}\label{sec:Conformance / Driver Conformance / ISM Driver Conformance}
> > +
> > +A ISM driver MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{drivernormative:Device Types / ISM Device / Device Initialization}
> > +\item \ref{drivernormative:Device Types / ISM Device / Device Operation / Alloc ISM Region}
> > +\item \ref{drivernormative:Device Types / ISM Device / Device Operation / Attach ISM Region}
> > +\item \ref{drivernormative:Device Types / ISM Device / Device Operation / Detach ISM Region}
> > +\end{itemize}
> > +
> >   \conformance{\section}{Device Conformance}\label{sec:Conformance / Device Conformance}
> >   A device MUST conform to the following normative statements:
> > @@ -621,6 +632,21 @@ \section{Conformance Targets}\label{sec:Conformance / Conformance Targets}
> >   \item \ref{devicenormative:Device Types / PMEM Device / Device Operation / Virtqueue return}
> >   \end{itemize}
> > +\conformance{\subsection}{ISM Device Conformance}\label{sec:Conformance / Device Conformance / ISM Device Conformance}
> > +
> > +A ISM device MUST conform to the following normative statements:
> > +
> > +\begin{itemize}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device configuration layout}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Initialization}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Operation / Alloc ISM Region}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Operation / Query ISM Region}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Operation / Attach ISM Region}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Operation / Detach ISM Region}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Operation / Grant ISM Region}
> > +\item \ref{devicenormative:Device Types / ISM Device / Device Operation / Inform Event IRQ Vector}
> Though using control vq to configure irq is good idea, I guess
> queue_msix_vector can be used. It needs some more text that
> queue_msix_vector will not be used etc.
> 
> if the event queue create interface exists over ctrl vq than things tied up
> well. Else I think transport specific existing scheme more aligns to the
> spec.
> 
> > +\end{itemize}
> > +
> >   \conformance{\section}{Legacy Interface: Transitional Device and Transitional Driver Conformance}\label{sec:Conformance / Legacy Interface: Transitional Device and Transitional Driver Conformance}
> >   A conformant implementation MUST be either transitional or
> >   non-transitional, see \ref{intro:Legacy
> > diff --git a/content.tex b/content.tex
> > index 96f4723..fe02aec 100644
> > --- a/content.tex
> > +++ b/content.tex
> > @@ -7545,6 +7545,7 @@ \subsubsection{Legacy Interface: Framing Requirements}\label{sec:Device
> >   \input{virtio-scmi.tex}
> >   \input{virtio-gpio.tex}
> >   \input{virtio-pmem.tex}
> > +\input{virtio-ism.tex}
> >   \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
> > diff --git a/virtio-ism.tex b/virtio-ism.tex
> > new file mode 100644
> > index 0000000..a1720d8
> > --- /dev/null
> > +++ b/virtio-ism.tex
> > @@ -0,0 +1,573 @@
> > +\section{ISM Device}\label{sec:Device Types / ISM Device}
> > +
> > +\begin{lstlisting}
> > +|-------------------------------------------------------------------------------------------------------------|
> > +| |------------------------------------------------|    |------------------------------------------------|    |
> > +| | VM                      [M1]   [M2]   [M3]     |    | VM                             [M2]   [M3]     |    |
> > +| |                          |      |      |       |    |                                 |      |       |    |
> > +| |   -----------------------|------|------|---    |    |   ------------------------------|------|---    |    |
> > +| |   |             driver   |      |      |  |    |    |   |             driver          |      |  |    |    |
> > +| |   -----------------------|------|------|---    |    |   ------------------------------|------|---    |    |
> > +| |    |cq|                  |map   |map   |map    |    |    |cq|                         |map   |map    |    |
> > +| |    |  |                  |      |      |       |    |    |  |                         |      |       |    |
> > +| |    |  |                -------------------     |    |    |  |                -------------------     |    |
> > +| |----|--|----------------|  device memory  |-----|    |----|--|----------------|  device memory  |-----|    |
> > +| |    |  |                -------------------     |    |    |  |                -------------------     |    |
> > +| |                                |               |    |                                |               |    |
> > +| |                                |               |    |                                |               |    |
> > +| |                                |               |    |                                |               |    |
> > +| |--------------------------------+---------------|    |--------------------------------+---------------|    |
> > +|                                  |                                                       |                  |
> > +|                                  |                                                       |                  |
> > +|                                  |------------------------------+------------------------|                  |
> > +|                                                                 |                                           |
> Above line is misaligned.
> 
> > +|                                                                 |                                           |
> > +|                                                   --------------------------                                |
> > +|                                                    | M1 |   | M2 |   | M3 |                                 |
> > +|                                                   --------------------------                                |
> > +|                                                                                                             |
> > +|                                                                                                             |
> > +|-------------------------------------------------------------------------------------------------------------|


And I think this is a bad way to include drawings.
There are lots of latex packages for diagrams, please
pick one.


> > +\end{lstlisting}
> > +
> > +An ISM(Internal Shared Memory) device provides the ability to access memory
> > +shared between multiple devices. This allows low-overhead communication in
> > +presence of such memory. For example, memory can be shared with guests of
> > +multiple virtual machines running on the same host, with each virtual machine
> > +including an ism device and with the guests getting the shared memory by the ism
> > +devices.
> > +
> > +An ism device can communicate with multiple peers simultaneously. This
> > +communication can be dynamically started and ended.
> > +
> > +All the devices with the ability to communicate with each other form a
> > +communication domain. Two devices from different communication domains can't
> > +communicate.
> > +
> > +The device memory of the ism device is divided into multiple chunks with the
> > +same size. Every ism region contains multiple chunks. When communicating between
> > +two devices, an ism region is used as a shared memory.
> > +
> > +The ism region is the basis for communication between ism devices.
> > +
> > +The process of communication between two drivers is that one driver allocates an
> > +ism region and obtains a token. Then the peer uses this token to attach the same
> The peer driver will make it more clear.
> 
> > +ism region, the two drivers realize the memory(ism region) sharing. The driver
> > +can also notify peer by kick notify-address the ism region has been updated.
> > +
> > +An ism region can be referred by its \field{token}, or the \field{offset}.
> > +The \field{offset} is the offset of the first chunk inside the ism region
> > +starting from the device memory head.
> > +
> > +\subsection{Device ID}\label{sec:Device Types / ISM Device / Device ID}
> > +	44
> > +
> > +\subsection{Virtqueues}\label{sec:Device Types / ISM Device / Virtqueues}
> > +\begin{description}
> > +\item[0] controlq
> > +\item[1] eventq
> > +\end{description}
> > +
> > +\subsection{Feature bits}\label{sec:Device Types / ISM Device / Feature bits}
> > +\begin{description}
> > +\item[VIRTIO_ISM_F_DEV_MEM(0)] Device provide memory for ism region, driver
> > +    don't need to provide memory for alloc/attach operation.
> > +
> > +\end{description}
> > +
> > +\subsection{Device configuration layout}\label{sec:Device Types / ISM Device / Device configuration layout}
> > +
> > +\begin{lstlisting}
> > +struct virtio_ism_config {
> > +	le128 cdid;
> le128 data type is not present in the spec.
> Better to define uuid data structure and refer here.
> 
> struct uuid {..}
> 
> struct uuid cdid;
> ...

Agree. And is it really little endian?

-- 
MST


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


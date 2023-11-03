Return-Path: <virtio-comment-return-8149-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9093C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:52:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 162BB2A890
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:52:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E4FE1986C36
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 11:52:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id CD69D986C33; Fri,  3 Nov 2023 11:52:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BE9D7986C34
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 11:52:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: uPsaNz29P6G69GPOBatdsQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699012359; x=1699617159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rlkEWZgT17ozLB9x43Zmm+cbaCexLJEPHFV54iDcriE=;
        b=IJ086VWmgTF2Y6XcEdpjidjorhm11HonpZADylOj9mdD3yutsZJiN9K0gQkZH1vReE
         8dkiv930g0D9Y+0GoF4WyCzvD7TeEVTMN9hfya2FeawLZZ2JVEYZanqyK+HD7OTipowk
         46lYGUfBPKv/+HM9fPULeNhq1zxRRN0aPw8TEIxrz+PjKlrhx6sRBLdA2eCyzSOuNYeU
         w9d4AArbjP1LryGjWsR2DRqehjYqe0a5fOmSaoUDQVCosvQKAy5Nb+SaWGzoWo+WLTtU
         aymAhStCcLUWn+kwQSp5rGpsLcmein3ibk1GRWy57iner05rcJP7zXiZ1IQuDTaGYiW2
         EWmA==
X-Gm-Message-State: AOJu0Yy7EEcnJT7iYYEiAQtD8KG1dujS5slxkUe8Jzpy2qX5gLTXO2ia
	NRr1TtqkdEISYxnufOQLXjehpYeunRZGi47x3ZVieImwGRSyxTG7EdiDADTiZPi7Aft2H7d8Jrw
	Q0HnOLW+TYL8rAIHJtcCqqalZtq3U/SWUzA==
X-Received: by 2002:a05:6512:3d0b:b0:500:8f66:5941 with SMTP id d11-20020a0565123d0b00b005008f665941mr20213141lfv.50.1699012359696;
        Fri, 03 Nov 2023 04:52:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELQJDnUsa9bzA2h+ivNv23eC2ceR1n1uEonz5f+At3CmHDG0NMyyWcSETqRM9F5L77oPgkOQ==
X-Received: by 2002:a05:6512:3d0b:b0:500:8f66:5941 with SMTP id d11-20020a0565123d0b00b005008f665941mr20213118lfv.50.1699012359285;
        Fri, 03 Nov 2023 04:52:39 -0700 (PDT)
Date: Fri, 3 Nov 2023 07:52:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: jasowang@redhat.com, eperezma@redhat.com, cohuck@redhat.com,
	stefanha@redhat.com, virtio-comment@lists.oasis-open.org,
	parav@nvidia.com
Message-ID: <20231103065138-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-2-lingshan.zhu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20231103103437.72784-2-lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH V2 1/6] virtio: introduce virtqueue state

On Fri, Nov 03, 2023 at 06:34:32PM +0800, Zhu Lingshan wrote:
> This patch adds new virtqueue facility to save and restore virtqueue
> state. The virtqueue state is split into two parts:
> 
> - The available state: The state that is used for read the next
>   available buffer.
> - The used state: The state that is used for make buffer used.
> 
> This will simply the transport specific method implementation. E.g two
> le16 could be used instead of a single le32). For split virtqueue, we
> only need the available state since the used state is implemented in
> the virtqueue itself (the used index). For packed virtqueue, we need
> both the available state and the used state.
> 
> The typical use cases are live migration and debugging.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  content.tex     |  7 ++++--
>  packed-ring.tex | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
>  split-ring.tex  | 39 +++++++++++++++++++++++++++++++++
>  3 files changed, 102 insertions(+), 2 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index 0a62dce..76813b5 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -99,10 +99,10 @@ \section{Feature Bits}\label{sec:Basic Facilities of a Virtio Device / Feature B
>  \begin{description}
>  \item[0 to 23, and 50 to 127] Feature bits for the specific device type
>  
> -\item[24 to 41] Feature bits reserved for extensions to the queue and
> +\item[24 to 42] Feature bits reserved for extensions to the queue and
>    feature negotiation mechanisms
>  
> -\item[42 to 49, and 128 and above] Feature bits reserved for future extensions.
> +\item[43 to 49, and 128 and above] Feature bits reserved for future extensions.
>  \end{description}
>  
>  \begin{note}
> @@ -872,6 +872,9 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_QUEUE_STATE(42)] This feature indicates that the device allows the driver
> +  to access its internal virtqueue state.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> diff --git a/packed-ring.tex b/packed-ring.tex
> index 9eeb382..ad6aba0 100644
> --- a/packed-ring.tex
> +++ b/packed-ring.tex
> @@ -729,3 +729,61 @@ \subsection{Receiving Used Buffers From The Device}\label{sec:Basic Facilities o
>          process_buffer(d);
>  }
>  \end{lstlisting}
> +
> +\subsection{Virtqueue State}\label{sec:Basic Facilities of a Virtio Device / Packed Virtqueues / Virtqueue State}
> +
> +When VIRTIO_F_QUEUE_STATE has been negotiated, the driver can set and
> +get the device internal virtqueue state through the following
> +fields. The implementation of the interfaces is transport specific.
> +
> +\subsubsection{\field{Available State} Field}
> +
> +The available state field is two bytes of virtqueue state that is used by
> +the device to read the next available buffer. It is presented in the followwing format:
> +
> +\begin{lstlisting}
> +le16 {
> +  last_avail_idx : 15;
> +  last_avail_wrap_counter : 1;
> +};
> +\end{lstlisting}
> +
> +The \field{last_avail_idx} field is the free-running location
> +where the device read the next descriptor from the virtqueue descriptor ring.
> +
> +The \field{last_avail_wrap_counter} field is the last driver ring wrap
> +counter that was observed by the device.
> +
> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Counters}.
> +
> +\subsubsection{\field{Used State} Field}
> +
> +The used state field is two bytes of virtqueue state that is used by
> +the device when marking a buffer used. It is presented in the followwing format:
> +
> +\begin{lstlisting}
> +le16 {
> +  used_idx : 15;
> +  used_wrap_counter : 1;
> +};
> +\end{lstlisting}
> +
> +The \field{used_idx} field is the free-running location where the device write the next
> +used descriptor to the descriptor ring.
> +
> +The \field{used_wrap_counter} field is the wrap counter that is used
> +by the device.
> +
> +See also \ref{sec:Packed Virtqueues / Driver and Device Ring Wrap Counters}.
> +
> +\devicenormative{\subsubsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Packed Virtqueues/ Virtqueue State}
> +
> +The device SHOULD only accept setting Virtqueue State of any packed virtqueues when DRIVER_OK is not set in \field{device status}, or SUSPEND is set in \field{device status}.

Except SUSPEND is undefined and is explained in patch 2 :(
Please do not split patches like this, you are just
splitting them at random boundaries.


> +Otherwise the device MUST ignore any writes to Virtqueue State of any packed virtqueues.
> +
> +When SUSPEND is set, the device MUST record the Virtqueue State of every enabled packed virtqueue
> +in \field{Available State} field and \field{Used State} field respectively,
> +and correspondingly restore the Virtqueue State of every enabled packed virtqueue
> +from \field{Available State} field and \field{Used State} field when DRIVER_OK is set.
> +
> +The device SHOULD reset \field{Available State} field and \field{Used State} field upon a device reset.
> diff --git a/split-ring.tex b/split-ring.tex
> index de94038..a78b44d 100644
> --- a/split-ring.tex
> +++ b/split-ring.tex
> @@ -734,3 +734,42 @@ \subsection{Receiving Used Buffers From The Device}\label{sec:Basic Facilities o
>  }
>  \end{lstlisting}
>  \end{note}
> +
> +\subsection{Virtqueue State}\label{sec:Basic Facilities of a Virtio Device / Splited Virtqueues / Virtqueue State}
> +
> +When VIRTIO_F_QUEUE_STATE has been negotiated, the driver can set and
> +get the device internal virtqueue state through the following
> +fields. The implementation of the interfaces is transport specific.
> +
> +\subsubsection{\field{Available State} Field}
> +
> +The available state field is two bytes of virtqueue state that is used by
> +the device to read the next available buffer. It is presented in the followwing format:
> +
> +\begin{lstlisting}
> +le16 last_avail_idx;
> +\end{lstlisting}
> +
> +The \field{last_avail_idx} field is the free-running available ring
> +index where the device will read the next available head of a
> +descriptor chain.
> +
> +See also \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / The Virtqueue Available Ring}.
> +
> +\drivernormative{\subsubsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Splited Virtqueues/ Virtqueue State}
> +
> +The driver SHOULD NOT access \field{Used State} of any splited virtqueues, it SHOULD use the
> +used index in the used ring.
> +
> +\devicenormative{\subsubsection}{Virtqueue State}{Basic Facilities of a Virtio Device / Splited Virtqueues/ Virtqueue State}
> +
> +The device SHOULD only accept setting Virtqueue State of any splited virtqueues
> +when DRIVER_OK is not set in \field{device status} or SUSPEND is set in \field{device status}.
> +Otherwise the device MUST ignore any writes to Virtqueue State of any splited virtqueues.

all these requests to ignore writes are to what end? just prohibit
driver from doing this.

> +
> +When SUSPEND is set, the device MUST record the Available State of every enabled splited virtqueue
> +in \field{Available State} field,
> +and correspondingly restore the Available State of every enabled splited virtqueue
> +from \field{Available State} field when DRIVER_OK is set.
> +
> +The device SHOULD reset \field{Available State} field upon a device reset.

At this point I have no idea
- how can a state of a virtqueue at a random time be represented
  by a 16 bit integer
- if it's not at a random time then why do you even need an integer -
  synchronize queue to memory and then all state is in memory



> -- 
> 2.35.3


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


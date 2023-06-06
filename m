Return-Path: <virtio-comment-return-6162-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80912C7EE24
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:11:54 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CC9C72AC9F
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:11:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B1D06986572
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:11:53 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A640D9864BB; Tue,  6 Jun 2023 19:11:53 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 948E99864C1
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 19:11:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 6clgQZ7IMSq6M_vP84JNLg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078710; x=1688670710;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osgMM5W1gjDCaR21GyNUnjnLXSZylAEMtKy5A6ioZv4=;
        b=fbFDssHUMP6nVNRWbGPdFkbs+1YWlr1Vn0NcHgMiov/aghCA35EG/O+IcXRevrxJvx
         0J4KGXbezZg/Ayugy7LBXvykO8H38yYRtgLXfHqkFNSuLJ9ARsqfSz/VxsmCVss6hXaU
         9qtMvA39wEQt8PnDaScMD/o0NvKYDs/Z6WE2/pcPDpJQpETf449RNn/UIY0BnEZ8Vr1I
         /u4dE5xWR9e0OLywjLvT2rwK+bqR+rUQwJEYVz4nBerG8aWkd731v13DghlNzX71uado
         7qznTGMGacRWa8BCh42vnmRzuCIxQjyQc0Oz19TatnYmx2svNKRRbEVp0/AYPvLGsS3o
         wPjg==
X-Gm-Message-State: AC+VfDxXkZGpyEF7BfPxVT24Pi0pGpLV5G6eRHZFfd5Yi1DCKB9iOUNj
	3rbkQk3EyIUMwP0/Zuzu6k8LozJAN8OKC3OTjv6y9DlzZ6/Z4CQGQEcIbXW4FMoXz24TFxSXZu+
	jwnKOT1bvvFx+BHvwbPlEaapW1ZRVTNRSsA==
X-Received: by 2002:a1c:4c13:0:b0:3f5:ffe3:46a7 with SMTP id z19-20020a1c4c13000000b003f5ffe346a7mr2833481wmf.9.1686078710600;
        Tue, 06 Jun 2023 12:11:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76JkpX9g5GsWFXfFXBSMAsP54wPVPH52JSJVblqzD0Tejm59HmsCuRk/JKYQXndc2k8WJnDw==
X-Received: by 2002:a1c:4c13:0:b0:3f5:ffe3:46a7 with SMTP id z19-20020a1c4c13000000b003f5ffe346a7mr2833472wmf.9.1686078710291;
        Tue, 06 Jun 2023 12:11:50 -0700 (PDT)
Date: Tue, 6 Jun 2023 15:11:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Cc: virtio-comment@lists.oasis-open.org,
	Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>,
	cohuck@redhat.com, alvaro.karsz@solid-run.com,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Liuxiangdong <liuxiangdong5@huawei.com>,
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com,
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com,
	stefanha@redhat.com, Harpreet Singh Anand <hanand@xilinx.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com,
	Zhu Lingshan <lingshan.zhu@intel.com>,
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com,
	si-wei.liu@oracle.com
Message-ID: <20230606151003-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-2-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230606175511.2337208-2-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 1/2] virtio: introduce selective queue enabling

On Tue, Jun 06, 2023 at 07:55:10PM +0200, Eugenio Pérez wrote:
> This patch allows the driver to start the device (as set DRIVER_OK) with only
> some queues enabled, and then enable another queues later.
> 
> This is the current way to migrate net device state through control
> virtqueue, in a software assisted framework with vDPA:
> * First, only net CVQ is enabled at DRIVER_OK
> * All the control commands (mac address, mq, etc) needed for the device
> to behave the same as the source of migration are sent
> * Finally all the dataplane queues are enabled.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  content.tex | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/content.tex b/content.tex
> index d2ab9eb..ea4a6d8 100644
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
> @@ -398,6 +398,13 @@ \section{Virtqueues}\label{sec:Basic Facilities of a Virtio Device / Virtqueues}
>  Every driver and device supports either the Packed or the Split
>  Virtqueue format, or both.
>  
> +\subsection{Virtqueue selective enabling}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}
> +
> +If the driver negotiates VIRTIO\_F\_RING\_ENABLE\_ANYTIME,

No need for \_, we build with _ not being a special character.

> it can enable
> +individual virtqueues both before and after the DRIVER\_OK. The way to enable a
> +virtqueue is transport specific, but it mimics the re-enabling after an
> +hypothetical reset.
> +


This is not a good way to do it: spec describes a certain order
of initialization in several places. Please find all of them
and fix, don't just add a separate chapter as a kind of kludge.


>  \subsection{Virtqueue Reset}\label{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}
>  
>  When VIRTIO_F_RING_RESET is negotiated, the driver can reset a virtqueue
> @@ -870,6 +877,10 @@ \chapter{Reserved Feature Bits}\label{sec:Reserved Feature Bits}
>  	\ref{devicenormative:Basic Facilities of a Virtio Device / Feature Bits} for
>  	handling features reserved for future use.
>  
> +  \item[VIRTIO_F_RING_ENABLE_ANYTIME(42)] This feature indicates
> +  that the driver can enable a queue both before and after DRIVER\_OK.
> +  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}.
> +
>  \end{description}
>  
>  \drivernormative{\section}{Reserved Feature Bits}{Reserved Feature Bits}
> -- 
> 2.31.1


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


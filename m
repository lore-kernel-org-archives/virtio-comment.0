Return-Path: <virtio-comment-return-6160-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A8AC77B73
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:09:24 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 81D12157EE3
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:09:23 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6B274986572
	for <virtio-comment@archiver.kernel.org>; Tue,  6 Jun 2023 19:09:23 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 563469864BB; Tue,  6 Jun 2023 19:09:23 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4337A9864C1
	for <virtio-comment@lists.oasis-open.org>; Tue,  6 Jun 2023 19:09:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: AUNPZ5HPOMukHw42kc_9Iw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686078558; x=1688670558;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zek3pm+QhGTu5UWdxZWcT/Ke9tOW7s4s/oXDaMvod/U=;
        b=elwBb4jkJ/NOwrRR+G6MLUE3Ka0OKkHHcI1mPIloJmbQ1NA3cQ76uQ1YQEIvlLOLK1
         /oFGV3jqxHnr6MtyvPWxjA4U2dvhrW3399DHFfSGyUq+TcvIdZ969OvS46m+/oDbyt/D
         /HPXjlRv9SSqwHD72kjX10FxMBx7kr0LddyB9IDSxWF2K1glr0fBmkIK6vVmyejV6lC1
         fDA90xXYrvxeeb9a0sU5W64yKZZSlBkDb8qd0u+FN0DVIVgftS3zv5eTdZic/SfFc2Go
         RBazF2qnF6d5Qksjlx5HsFWres17I08b9NI1ZqsuFxhf6PwnTF98zSmMs/rH0ayLHF4u
         XdKg==
X-Gm-Message-State: AC+VfDxP4cnOyzWw3hX25aQePCVrOVjMsj5UNKO3ms7nP2Im46xhpvIQ
	4/+avRYvx/5N4elcaJe+blsNH3OicSy/+/1xOm085ZUm3yQ5HArsNejGzVKT+AAwhc+U/yVVa54
	4YlwFONZ+wcLbTqDenE73z+lHn1zhXOgXbg==
X-Received: by 2002:a05:600c:20c:b0:3f6:be1:b8d6 with SMTP id 12-20020a05600c020c00b003f60be1b8d6mr2875382wmi.9.1686078558243;
        Tue, 06 Jun 2023 12:09:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6Qnc4PpmZBgBNEhnZEP8DbPREMFKnSSs5vJrmEJwZ6apeLchHGegdnRzaszKtrl00L1Jqj/A==
X-Received: by 2002:a05:600c:20c:b0:3f6:be1:b8d6 with SMTP id 12-20020a05600c020c00b003f60be1b8d6mr2875362wmi.9.1686078557906;
        Tue, 06 Jun 2023 12:09:17 -0700 (PDT)
Date: Tue, 6 Jun 2023 15:09:09 -0400
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
Message-ID: <20230606150327-mutt-send-email-mst@kernel.org>
References: <20230606175511.2337208-1-eperezma@redhat.com>
 <20230606175511.2337208-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230606175511.2337208-3-eperezma@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [PATCH 2/2] virtio: pci support virtqueue selective enabling

On Tue, Jun 06, 2023 at 07:55:11PM +0200, Eugenio Pérez wrote:
> Reusing virtqueue reset method to enabling a vq.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>  transport-pci.tex | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/transport-pci.tex b/transport-pci.tex
> index a5c6719..04c0429 100644
> --- a/transport-pci.tex
> +++ b/transport-pci.tex
> @@ -375,6 +375,10 @@ \subsubsection{Common configuration structure layout}\label{sec:Virtio Transport
>  
>  \item[\field{queue_enable}]
>          The driver uses this to selectively prevent the device from executing requests from this virtqueue.
> +        If the driver negotiates VIRTIO_F_RING_ENABLE_ANYTIME or
> +        VIRTIO_F_RING_RESET, the driver writes 1 to this field to enable a
> +        virtqueue.  See \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Selective Virtqueue Enable}
> +        and \ref{sec:Basic Facilities of a Virtio Device / Virtqueues / Virtqueue Reset}.
>          1 - enabled; 0 - disabled.

No, this is always used to enable queues even with no features.

>  \item[\field{queue_notify_off}]
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


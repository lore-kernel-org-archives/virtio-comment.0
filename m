Return-Path: <virtio-comment-return-6761-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B636EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 18:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 99B9576048
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 18:20:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 70F0F986809
	for <virtio-comment@archiver.kernel.org>; Thu,  6 Jul 2023 18:20:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 576B098672D; Thu,  6 Jul 2023 18:20:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1937C98672E
	for <virtio-comment@lists.oasis-open.org>; Thu,  6 Jul 2023 18:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: P9VsuNOQOfycVpo3wUtNPA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688667548; x=1691259548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9K0sVfNuG7t+UsWNa7qu8Nd29lv32o3M+pSSrvBeHs=;
        b=gpEpMHeA52yL0W+5hve6uy/2F5AcQKJhahxq6GNAxosBvDAYCm9eGQXWMYCwYH+a5M
         m1IPtioh2OSMzRmVSWFKmF0bRXgL3Cf+buR+2Zzn0EVv9xAKVnLm/YB5urO4k1VkX5ch
         skedrOoO7tSeE2QZB6VkEyF2OvIymvr0+C150xraZJdm7enRmVr69o4Z2sXnaWmaCeuy
         bnSBzl37uTh2BtAjtLIHz32qQcP2UoG9n2lZOzcJC9faH4aIOrcbgW7/sX2B1VyRXypF
         8AhbA2fYkvjeJBm/5BrW2OBu+Rc4katiSD9B0sCGHz3tGQTWsHCM5Z/AR9nlHHQTbVCU
         jLlA==
X-Gm-Message-State: ABy/qLZKIuuQSHP3kWiD2aMIRThahGOQzOknY5djH9yioSyh7eT90kHe
	ALlrZO/s6/gAoiYW4dxOwbVJzMm/MWPyZBnuSUVLbb8Xm4X1y1fKCRCQy4qJo7hnin2JUC6srgq
	pCpF+CFORbiOsMNeoySX6Cw7U0rJoJr8ua93agiGvDsWn6uBAk7w+ayXSyg==
X-Received: by 2002:a5b:749:0:b0:c5f:15f2:375 with SMTP id s9-20020a5b0749000000b00c5f15f20375mr2429196ybq.9.1688667548715;
        Thu, 06 Jul 2023 11:19:08 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG0KgvAQ98AvgJ9LFhbp9OX16fUO9TlL2BTMKFpVlSH+H1OkMF3vx0by4mHsGG5JAfiGOatKypj9T3S3A860v4=
X-Received: by 2002:a5b:749:0:b0:c5f:15f2:375 with SMTP id s9-20020a5b0749000000b00c5f15f20375mr2429173ybq.9.1688667548440;
 Thu, 06 Jul 2023 11:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com>
In-Reply-To: <20230606175511.2337208-1-eperezma@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 6 Jul 2023 20:18:31 +0200
Message-ID: <CAJaqyWe6nR_5bAfuqBfDJY8T-OPfHcjoYbXMyEQEEgL5Oko8WQ@mail.gmail.com>
To: virtio-comment@lists.oasis-open.org
Cc: Laurent Vivier <lvivier@redhat.com>, Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, 
	alvaro.karsz@solid-run.com, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, 
	si-wei.liu@oracle.com, mst@redhat.com, Yan Vugenfirer <yvugenfi@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH 0/2] Selective queue enabling

On Tue, Jun 6, 2023 at 7:55=E2=80=AFPM Eugenio P=C3=A9rez <eperezma@redhat.=
com> wrote:
>
> This series allows the driver to start the device (as set DRIVER_OK) with=
 only
> some queues enabled, and then enable another queues later.
>
> This is the current way to migrate net device state through control
> virtqueue, in a software assisted framework with vDPA:
> * First, only net CVQ is enabled at DRIVER_OK
> * All the control commands (mac address, mq, etc) needed for the device
> to behave the same as the source of migration are sent
> * Finally all the dataplane queues are enabled.
>

Adding Yan to the thread, who mentioned that he is looking for
something similar in the virtio-networking upstream meeting.

> Eugenio P=C3=A9rez (2):
>   virtio: introduce selective queue enabling
>   virtio: pci support virtqueue selective enabling
>
>  content.tex       | 15 +++++++++++++--
>  transport-pci.tex |  4 ++++
>  2 files changed, 17 insertions(+), 2 deletions(-)
>
> --
> 2.31.1
>
>
>
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
>
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
>
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-l=
ists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/


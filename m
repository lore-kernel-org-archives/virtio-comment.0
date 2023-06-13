Return-Path: <virtio-comment-return-6320-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2ACC7EE2E
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 08:28:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C8BC97C6A6
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 08:28:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A88AF98657D
	for <virtio-comment@archiver.kernel.org>; Tue, 13 Jun 2023 08:28:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 960CA9842EA; Tue, 13 Jun 2023 08:28:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 824D898653E
	for <virtio-comment@lists.oasis-open.org>; Tue, 13 Jun 2023 08:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: G9WqyNDDPbCkUBpraVBpmA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686644932; x=1689236932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VTl8yAx8ONPCT4bqmQ5OZG2FcrTKUxWD2m364mEbP7M=;
        b=hZFwtFljBTieViPon0fw2lO2pYf4RrXfF9o0LDTQGTaHHuP1EwSqnhWVA/x6AUvJS6
         peCO0ow60/BJs3R58mg1leD7GGe3iMPMY+5Z9v4lSOCYzySczh6eEVc5hmGi5kCxIMUd
         IuvZOM+EUZSMy3Iw0ZFBBqcuH3Lt+RWk5wAeRT7APsticwlGCECXrw6h7QLQESelcAZD
         5sFWnKbnNpOQBJ2rAFvxwFN5ZT2MWAJeNgHqwe/Krw8V2ANN1WJ30o7LLbTeEZghfcYD
         sxthXRj6puhShvIfRsb9rStMah8xEsxRZsWhJWnxku4lDvDxgVwP2YmUV68ChYs+09uQ
         uiJw==
X-Gm-Message-State: AC+VfDzdV/jkVpJ1iaI6Y5QKB6HEI/76Mr5IHNl8QF1XekySDG9/3s0x
	mAWL9vYM1zmJoAZFAOc99EX28r0j9OLYF6hZSe41PCUxrabNBTYKA1R0/Q/AV6x+ylidG0BfMoZ
	6K9NZAWpdls7Z0RHUoFc8/NsjaXVmrz+TOq2Qde2pHG5nJIF2lw==
X-Received: by 2002:a81:7384:0:b0:559:deed:f363 with SMTP id o126-20020a817384000000b00559deedf363mr1131520ywc.2.1686644932274;
        Tue, 13 Jun 2023 01:28:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4tPFAAv8ie2THRssGStKnL4uaIV5oGU/sOl/n+Gdj6b2dv8cTTGH+QiQHsWPKhcfKiy/yQlNDP4HdXR/yj+Js=
X-Received: by 2002:a81:7384:0:b0:559:deed:f363 with SMTP id
 o126-20020a817384000000b00559deedf363mr1131510ywc.2.1686644932091; Tue, 13
 Jun 2023 01:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606175511.2337208-2-eperezma@redhat.com>
 <20230613034645-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230613034645-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 13 Jun 2023 10:28:16 +0200
Message-ID: <CAJaqyWeCyC-ZMu-zzO_3XZjXO-+bLEC02Hcfa=MB4V=VOUCFWw@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, jasowang@redhat.com, 
	Zhu Lingshan <lingshan.zhu@intel.com>, Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, 
	si-wei.liu@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH 1/2] virtio: introduce selective queue enabling

On Tue, Jun 13, 2023 at 9:50=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Jun 06, 2023 at 07:55:10PM +0200, Eugenio P=C3=A9rez wrote:
> > This patch allows the driver to start the device (as set DRIVER_OK) wit=
h only
> > some queues enabled, and then enable another queues later.
> >
> > This is the current way to migrate net device state through control
> > virtqueue, in a software assisted framework with vDPA:
> > * First, only net CVQ is enabled at DRIVER_OK
> > * All the control commands (mac address, mq, etc) needed for the device
> > to behave the same as the source of migration are sent
> > * Finally all the dataplane queues are enabled.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
>
>
> I realized I never asked. *Why* enable CVQ so early?
> I think it's so that commands take effect before any
> buffers are processed? So maybe it's a net specific
> issue?
>

Yes, that's the reason. Can I add something to the patch message to
make it clearer?

It can be solved using a net specific solution for sure, but I think
we can make it general if other devices with CVQ have such needs.

Thanks.


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


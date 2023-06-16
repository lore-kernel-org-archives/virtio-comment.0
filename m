Return-Path: <virtio-comment-return-6361-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE500EB64D7
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Jun 2023 09:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 016F6F3F4C
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Jun 2023 09:20:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D7CD7986804
	for <virtio-comment@archiver.kernel.org>; Fri, 16 Jun 2023 09:20:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C32AF983EB8; Fri, 16 Jun 2023 09:20:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E95E89867FF
	for <virtio-comment@lists.oasis-open.org>; Fri, 16 Jun 2023 09:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 3RkRbDpkNUSHMKMOOXtIcg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686907221; x=1689499221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GXJ1CJxKc0jOZNdJIHEfvFuqe/jYvHVLjucnFpYa2eQ=;
        b=hG5qDh+DBF3XYmr1IUdfxrGLpzqtdlpQMqRxwljXsNFPvc1fFwIgCZusP3cENeq6Kz
         8D7Se50nz5gomqHh+R+q8/7tdvFc4G9gJIxqklofMohtyQFlYqqwP0tv5p0mnoFRaA3e
         fLh9iJIzkHp+cpbhIryJHRUy1IRc5jm/3l2/rrQGVReiSVxKINfmpqJr9SJD0aSzPhKe
         8bKnjq5Bog/1TRbE3r1s7j9FubdODtuE4UPaS7zO7e7Bb65i6yew+zBXTYWnOQyN+ve3
         6fDdRnn9oqIMon9EINO8EJItZp51jIYN9TFGmbB2uCxBzP1HoykMKJxe7cqUEliHRoo/
         ZubA==
X-Gm-Message-State: AC+VfDza+8dIzTENcLFzg8EU1x6FCP4eZ2H70r3TVUUxqJ69EIk8NhXH
	tKiHp8s6dehWFZUnPCfo1iFi8gTjppV3OEXHNRzciW3KkLRbaafnOtucxPQeAINCHXGHCfDTpmy
	NiDAQ351LIMnmJvhzbR7RRPP6GmLmnktE8LeHBH0NNMuu8omblg==
X-Received: by 2002:a05:6102:34f5:b0:43f:5036:6783 with SMTP id bi21-20020a05610234f500b0043f50366783mr1300581vsb.0.1686907221632;
        Fri, 16 Jun 2023 02:20:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Xgw1no4f5FrzOgtorJx5pBZhOaRIW+F3PcXJ4s/j/kndKQm7Q+9QOiOeyAQK1BsZ/gWyuL/6MPhjcbEY/t4I=
X-Received: by 2002:a05:6102:34f5:b0:43f:5036:6783 with SMTP id
 bi21-20020a05610234f500b0043f50366783mr1300565vsb.0.1686907221373; Fri, 16
 Jun 2023 02:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230608180617-mutt-send-email-mst@kernel.org>
 <20230609115250-mutt-send-email-mst@kernel.org> <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org> <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com>
 <PH0PR12MB5481746BE0C1B7CE4D098A7BDC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613154823-mutt-send-email-mst@kernel.org> <PH0PR12MB54811F91C70744E7A83BD10ADC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230613173837-mutt-send-email-mst@kernel.org> <PH0PR12MB5481CBCA2D51F3B67581C100DC55A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <c78d5554-ac1b-ed67-01d0-00943e69af44@intel.com> <PH0PR12MB548104F31CA38275A2D7E41EDC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <476b3ec4-0a19-2f61-4d2a-e4badfbeb499@intel.com> <PH0PR12MB548153E61A5C67902F427746DC5AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <a948882f-7646-7cef-d04d-b7ead9336cc5@intel.com>
In-Reply-To: <a948882f-7646-7cef-d04d-b7ead9336cc5@intel.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 16 Jun 2023 11:19:45 +0200
Message-ID: <CAJaqyWePo5J+EyRjTDNVr1fCsrwhmWzg54WJvfF2czVTwa4PaA@mail.gmail.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>, Liuxiangdong <liuxiangdong5@huawei.com>, 
	Gautam Dawar <gdawar@xilinx.com>, "longpeng2@huawei.com" <longpeng2@huawei.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, "stefanha@redhat.com" <stefanha@redhat.com>, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Shannon Nelson <snelson@pensando.io>, 
	Max Gurtovoy <mgurtovoy@nvidia.com>, "si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Thu, Jun 15, 2023 at 7:56=E2=80=AFAM Zhu, Lingshan <lingshan.zhu@intel.c=
om> wrote:
>
>
>
> On 6/14/2023 7:56 PM, Parav Pandit wrote:
> >> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> >> Sent: Wednesday, June 14, 2023 2:11 AM
> >> On 6/14/2023 12:32 PM, Parav Pandit wrote:
> >>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> >>>> Sent: Wednesday, June 14, 2023 12:27 AM
> >>>>> If a device has assumed that queue_reset must be done after
> >>>>> DRIVER_OK stage because until that point the device is not "live",
> >>>>> Such device needs the
> >>>> fix.
> >>>> I think queue_reset just resets the queue and its fields including
> >>>> the queue_enable. DRIVER_OK is not a must for performing a
> >>>> queue_reset, My understanding is:
> >>>> - before DRIVER_OK, the driver can re-config the queue anytime,
> >>>> doesn't need a reset_queue
> >>> Before DRIVER_OK stage, to reconfigure a queue, driver needs to write
> >> queue_enable =3D 0.
> >>> This is not allowed in the spec.
> >>> So driver need to use queue_reset to reconfigure.
> >> The spec requires the driver config all other fields before set queue_=
enable.
> >> I am not sure whether there are real occurring cases that re-config th=
e vq fields
> >> between queue_enable and DRIVER_OK in the initialization.
> >>
> > Probably there is no case today, but may be it can occur where driver t=
ries to configure something and if it fails, it may need to roll back and r=
e-configure queues.
> >
> >> But I agree maybe we should allow set queue_enable =3D 0.
> >>
> > This functionality of queue_enable =3D 0, is supported using queue_rese=
t register.
> >
> >> This reset may happen after DRIVER_OK.
> > Yes, the queue_reset after DRIVER_OK is not ambiguous.
> > Queue_reset before DRIVER_OK has the ambiguity, and will clarify that i=
t should be supported by device before DRIVER_OK.
> >
> > For the main motivation of this patch, the _RESET bit seems enough to s=
electively enable the queue before or after DRIVER_OK.
> I guess the intention may be:
> Step 1: the hypervisor owns all queues, it enables all queues and cvq,
> set queue fields with phony host values.
> Then set DRIVER_OK, config the device and send commands through cvq.
> But don't do link announce. So the device would not consume the
> descriptors and external network will not send
> any data to it.
>

Even without a link announcement, the device can process descriptors.
Some examples are receiving broadcast packets or just sending any
packet (which effectively acts as a link announcement for the network
topology).

Thanks!

> Step 2: Reset the queues, set the fields of the queues with guest
> config, selectively enable the queues,
> so the device works for the guest.
>
> Does this sounds good?
>
>
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


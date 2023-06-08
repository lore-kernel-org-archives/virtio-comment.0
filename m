Return-Path: <virtio-comment-return-6232-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E40C7EE45
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 11:54:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 828882B00A
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 11:54:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6CB69986668
	for <virtio-comment@archiver.kernel.org>; Thu,  8 Jun 2023 11:54:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 5AC6D986259; Thu,  8 Jun 2023 11:54:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 482E8986667
	for <virtio-comment@lists.oasis-open.org>; Thu,  8 Jun 2023 11:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: dLH7dwCdNwWlcsxWjhNMDQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686225248; x=1688817248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4qsLHMzfakFBaTU3MRBcILUh1yzzb1n9KzIWyVHLFAM=;
        b=d4qIXcTYX37Rj6TG8HJi8qXNFOs31zmzlba5vjozlrcFZBI/6gj9lRCcH2c9ZMqLfA
         wTgm2HwD7Gax1rGTD0mU3666fBw8+7z/zKAU6RiSyGa9ZzEsOpPshOyMrok0NvzMh7be
         VzJfHvnx1wK31E8jNwJ/WjXd5Bxomf84OjFs89XieWs12lnM6xKCCGAYOWPSmnsyhjG1
         UpdqYgpshwcIS6jTECp8q29XSVOx9uIIT2JLXvFTEmXdm5s328NaNuGJxqPUfPFDYdzt
         4wNwMfUbAMNfAySQro4ojDrYX4PT3a1/j9IbpTappngLsgV7nGNwYTB3VsQSyZim/bj2
         ga5g==
X-Gm-Message-State: AC+VfDzw+qczbUfNBWheGlLb2+faRGGJ6j/1z4+Pb/+eDC+1DkFoyTCk
	z6JJYZcshT/LToIMfB2xUfBwaFGYZ8lwR5SAvwT2IrhJem3ZM38NXU1VOn+fIRrsKore8PKBc2x
	PCTNXZTloD8sC3YowxUStH/r1EeUpYIqSHtx0ShYTsKO9i13PUA==
X-Received: by 2002:a81:68c4:0:b0:565:c21d:8ec6 with SMTP id d187-20020a8168c4000000b00565c21d8ec6mr10136691ywc.6.1686225248461;
        Thu, 08 Jun 2023 04:54:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4xTMzEOznqgOReegaCR2Q1Z3E7o3SWgycLd1MSjKdztre/aKrqSVgLoDEDXY8pyaz9EGh5ZUyUrXmdRbGyJhE=
X-Received: by 2002:a81:68c4:0:b0:565:c21d:8ec6 with SMTP id
 d187-20020a8168c4000000b00565c21d8ec6mr10136665ywc.6.1686225248231; Thu, 08
 Jun 2023 04:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230606175511.2337208-1-eperezma@redhat.com> <20230606175511.2337208-2-eperezma@redhat.com>
 <PH0PR12MB5481D1ACC60311CE48D622CFDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606151520-mutt-send-email-mst@kernel.org> <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54815243B0C6942A0E5B6B5FDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 8 Jun 2023 13:53:32 +0200
Message-ID: <CAJaqyWdKsbCiZqp=kNQOoaD6ooB+m2pcUB+nSLU3e5gCyLL1bQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"alvaro.karsz@solid-run.com" <alvaro.karsz@solid-run.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, 
	"longpeng2@huawei.com" <longpeng2@huawei.com>, Dragos Tatulea <dtatulea@nvidia.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
	Stefano Garzarella <sgarzare@redhat.com>, Heng Qi <hengqi@linux.alibaba.com>, 
	"jasowang@redhat.com" <jasowang@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	Shannon Nelson <snelson@pensando.io>, Max Gurtovoy <mgurtovoy@nvidia.com>, 
	"si-wei.liu@oracle.com" <si-wei.liu@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] RE: [PATCH 1/2] virtio: introduce selective
 queue enabling

On Tue, Jun 6, 2023 at 9:25=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Tuesday, June 6, 2023 3:20 PM
> > >
> > > Can you please highlight, current spec normative which indicates that
> > > all queues must be enabled before DRIVER_OK and more queues cannot be
> > > enabled after DRIVER_OK?
> >
> >
> > This one:
> > \drivernormative{\subsection}{Device Initialization}{General Initializa=
tion And
> > Device Operation / Device Initialization}
> >
> > it does not say "all queues" if you want to split hairs but I think ass=
uming it's
> > safe to enable queues later is dangerous.
> >
> Yes, I have read it few times and every time I concluded that:
> it does not say that it must be done before DRIVER_OK and cannot be done =
after DRIVER_OK.
>

I also read it this way to be honest. From a POV, to allow it if a
device does not handle it could be considered a fix, rather than an
addition.

I'm assuming we need to modify the standard just because it was not
explicitly allowed. To explicitly allow it before DRIVER_OK was not
needed because it was already widespread.

It would be great for me if we agree the device must support it, but
maybe it is just too late for that.

Thanks!

> > E.g. vhost user backends tend to assume no new queues appear after
> > DRIVER_OK.
>
> This backend implementation can be improved without introducing new bits =
on the guest side.
> Q reset is already a second example that demonstrates that queues will be=
 disabled/enabled after DRIVER_OK.
>
> And for PCI transport, PCI device and driver do not restrict queue_enable=
 access after DRIVER_OK.
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


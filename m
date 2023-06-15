Return-Path: <virtio-comment-return-6357-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C55EB64D9
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Jun 2023 08:35:53 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6E1C67C6A6
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Jun 2023 08:35:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 50E059866B2
	for <virtio-comment@archiver.kernel.org>; Thu, 15 Jun 2023 08:35:52 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 3C653986339; Thu, 15 Jun 2023 08:35:52 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 287F098663F
	for <virtio-comment@lists.oasis-open.org>; Thu, 15 Jun 2023 08:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: K3gDAlwYOSKidBh_ukaH1w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686818146; x=1689410146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7y4tEtLxOeUBrYTwQXVjadk9YSIDS+FiZcr5XMWSlTY=;
        b=l9KDfD9Rlysf4vpTIEPIMExD3Y79IwJwmKsuPHSMrW+pfsLjfaLhpFqEgcTs8pRQwq
         2AwP5ONoUNuW5zwLKj6AEjn8HjgHgo2eWE+sWQUYH+DCaciWTOjkwd3EsBERQwOZTWvT
         ft+Ws6Pt1gl/X06+LHI6VldL4GEUR/f3r+Nda7VURM8B5zLtnZIwn+MDpjr4idOycFeh
         q/GNUMiUOB2+EP+IXgHVXf3ujnYFQULxjTCulSub1zvJyeyKcDfeXhNhdA9mqr07RAzK
         5lH0hivqUxOamaL/O9Ki7eZnREQm3cWPZbeliI3NdSLZ6hc55s8Ib+tHmGqP3/Bby7jF
         p4WA==
X-Gm-Message-State: AC+VfDzwVX+DJ6YyCvgapJZqptWcz+Wtz/WNwJ8laEmQKPBbNErlRjKj
	ptn0Xtj97bTVRs64WRDLfOcqOqNUWmEy+H2oR+RrRhcyVjaE92F/WkMomLRry6K+nwL792h7CKe
	1DTplWKRKIlJknehhGtGg80mZ/LvqyaLQs/oMHe9X8CVgro6eWA==
X-Received: by 2002:a05:622a:13:b0:3f9:d619:bb1 with SMTP id x19-20020a05622a001300b003f9d6190bb1mr5570917qtw.7.1686818145990;
        Thu, 15 Jun 2023 01:35:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7bLDnWgMphg7IpMPlKRcENATGOPTs/RAOVVjXvZ+txecXkjldO0+zA1p1NXwpCkopynvLaVncAoy4dxVRPQJk=
X-Received: by 2002:a05:622a:13:b0:3f9:d619:bb1 with SMTP id
 x19-20020a05622a001300b003f9d6190bb1mr5570897qtw.7.1686818145770; Thu, 15 Jun
 2023 01:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAJaqyWfC0nhQJiwH4iuE_+L+55G=4=P_5HXwMVyGjeUJqa392Q@mail.gmail.com>
 <20230608031325-mutt-send-email-mst@kernel.org> <CAJaqyWf+vn06NHcQY208dwyB=WH3PQ3A7z53o0BTy102XrT+3Q@mail.gmail.com>
 <20230608180617-mutt-send-email-mst@kernel.org> <CAJaqyWf-=R+KHfBjzrGzkunTdeV8sAgFUv_kYoxNo3uqH2OOSw@mail.gmail.com>
 <20230609115250-mutt-send-email-mst@kernel.org> <CAJaqyWfOONuDoewWR7VcsxYB34=m23GqTo2=sroUf-JvvQGJcg@mail.gmail.com>
 <20230613034216-mutt-send-email-mst@kernel.org> <20230613035132-mutt-send-email-mst@kernel.org>
 <CAJaqyWfOi5D+f+JPBFZ8Rw+TCG5TLE+X8affo-EBaCAQx8_2vQ@mail.gmail.com> <20230613082755-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230613082755-mutt-send-email-mst@kernel.org>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 15 Jun 2023 10:35:09 +0200
Message-ID: <CAJaqyWdTPmvrGvOStY-uTg1KboAC6s7s8+1JkF1xWFUBwBVT+g@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	virtio-comment@lists.oasis-open.org, Laurent Vivier <lvivier@redhat.com>, 
	Cindy Lu <lulu@redhat.com>, cohuck@redhat.com, alvaro.karsz@solid-run.com, 
	Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>, longpeng2@huawei.com, 
	Dragos Tatulea <dtatulea@nvidia.com>, parav@nvidia.com, stefanha@redhat.com, 
	Harpreet Singh Anand <hanand@xilinx.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	Heng Qi <hengqi@linux.alibaba.com>, Zhu Lingshan <lingshan.zhu@intel.com>, 
	Shannon Nelson <snelson@pensando.io>, mgurtovoy@nvidia.com, si-wei.liu@oracle.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH 0/2] Selective queue enabling

On Tue, Jun 13, 2023 at 2:29=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Jun 13, 2023 at 12:12:43PM +0200, Eugenio Perez Martin wrote:
> > On Tue, Jun 13, 2023 at 9:53=E2=80=AFAM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> > >
> > > On Tue, Jun 13, 2023 at 03:46:35AM -0400, Michael S. Tsirkin wrote:
> > > > On Mon, Jun 12, 2023 at 09:56:57AM +0200, Eugenio Perez Martin wrot=
e:
> > > > > > > Another drawback of that is the long time a device can spend =
to
> > > > > > > reconfigure its memory maps.
> > > > > >
> > > > > > The map is already used for cvq though, I don't see why it woul=
d take
> > > > > > much more with this.
> > > > > >
> > > > >
> > > > > In the case of vDPA HW, CVQ maps may not need to reach the device=
's or
> > > > > platform IOMMU, so the modification of that mapping is way cheape=
r.
> > > >
> > > > Oh, I get it. It's setup time, but you are right.
> > > >
> > > > > > > taking that into account, does it make
> > > > > > > sense to send a new version with the bit 1 on enable?
> > > > > > >
> > > > > > > Thanks!
> > > > > >
> > > > > > Current hardware won't support the extra bit though.
> > >
> > >
> > > Thinking more about this, I think the following works:
> > >
> > > - enable all queues before DRIVER_OK
> > > - reset all data queues before DRIVER_OK
> > > - DRIVER_OK
> > > - CVQ commands
> > > - re-enable data queues
> > >
> > >
> > > No?
> > >
> >
> > If it is valid to write to queue_reset before DRIVER_OK, then sure. I
> > asked for that in the past at
> > https://lists.oasis-open.org/archives/virtio-dev/202305/msg00329.html
> > .
>
> Well then Jason said:
>  we should make svq work without RING_RESET
> but now apparently we went full circle and propose
> a feature bit after all?
>

My understanding is that RING_RESET covers more than just delaying the
enabling of net data vqs, like to change the address or properties of
vqs after DRIVER_OK. While the late enabling may be easy to implement
in current hw, vq property changes may be more challenging. There are
current HW that only support late enabling but not reconfigure the
queues. Ideally, just the subset of late enabling is needed.

Does it make sense to change the proposal to something in the line of:
RING_F_LATE_ENABLING: This feature flag is a subset of _F_RING_RESET.
If this feature is negotiated, all vqs start as if the vqs has been
reset before DRIVER_OK. This feature does not allow resetting a queue
once it is live.

Thanks!

>
> > >
> > >
> > > > --
> > > > MST
> > >
> > >
> > > This publicly archived list offers a means to provide input to the
> > > OASIS Virtual I/O Device (VIRTIO) TC.
> > >
> > > In order to verify user consent to the Feedback License terms and
> > > to minimize spam in the list archive, subscription is required
> > > before posting.
> > >
> > > Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> > > Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> > > List help: virtio-comment-help@lists.oasis-open.org
> > > List archive: https://lists.oasis-open.org/archives/virtio-comment/
> > > Feedback License: https://www.oasis-open.org/who/ipr/feedback_license=
.pdf
> > > List Guidelines: https://www.oasis-open.org/policies-guidelines/maili=
ng-lists
> > > Committee: https://www.oasis-open.org/committees/virtio/
> > > Join OASIS: https://www.oasis-open.org/join/
> > >
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


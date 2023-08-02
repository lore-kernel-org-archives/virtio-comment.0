Return-Path: <virtio-comment-return-6958-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF8C04A94
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 09:32:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B19C142A6E
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 09:32:25 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 942FD98664C
	for <virtio-comment@archiver.kernel.org>; Wed,  2 Aug 2023 09:32:25 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 831069865F7; Wed,  2 Aug 2023 09:32:25 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D0CF986602
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Aug 2023 09:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 5mPidbWeOtGRN4Bq1M7dXQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690968742; x=1691573542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0s6thgISZMDzvbujb6cNpTmk7DPHTusBe4UZfrYOcQ=;
        b=knHsbyRCslqv8oYztYPQLrpnrw2AP10hVBJbPshY8R+GdfJgaDNimSZMeY3TQQSsIP
         9ZERg+i94OqKPJqmOCrMZA2ZqX23bY1MhbUE33m9VTjgEDq5GGd+cUmztPP72bzDrjmJ
         RU7QHt34s+0NyBqi1ahy22NSlxwLnGAGHKEWpQkIIk2+sY5ZTtq38itn5hfoFhrJ3m9P
         L/gPEV8B2ct4gIIJIEGIr5rM3OEDcmCVoDXa0cz0qtymec0KB1imOk2WdmARxyp75Oda
         Q47ozcPWpRTrtYMs63c7c3G+eUH0Qqjecnm/U0OOonnbPvrjDzbR1ZVKeyXaDrjraEfA
         01VQ==
X-Gm-Message-State: ABy/qLalftgOmbArrk2n5DdpOCvVntUlT/dg2DKrCEg2yWKzD9zlXZNX
	M6877n9cG9mKYn7LRKBHpXrtrhnTOruDciHzm1rNz/cBSdHBuP/BB8S59luTBPRjLK57eMbZ5Qv
	vBL7ft8W5WnGX+xRFtY5HCCPgbxtF910CJfEgixcmsZiud3P9yA==
X-Received: by 2002:a05:651c:14b:b0:2b6:e0d3:45b7 with SMTP id c11-20020a05651c014b00b002b6e0d345b7mr4924857ljd.14.1690968741875;
        Wed, 02 Aug 2023 02:32:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHKFfFlBdadMZM35jvqgAH/GYRTBUvq/jqL5tvfMxHr1UPMUMMUyMGblDwOyoc3zQ/fIxrD3c0cLjbfvLB+haE=
X-Received: by 2002:a05:651c:14b:b0:2b6:e0d3:45b7 with SMTP id
 c11-20020a05651c014b00b002b6e0d345b7mr4924829ljd.14.1690968741483; Wed, 02
 Aug 2023 02:32:21 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB54818D33A150A01DACF3BF74DC0AA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsDo8dKSwD=Uovo=ekussqQmA8kf90jzuRoDBZs2B-GTw@mail.gmail.com> <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB548134EA03AE48ACD6F422CADC0BA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 2 Aug 2023 17:32:10 +0800
Message-ID: <CACGkMEvHjAkbQ1D_PNhObpZ00g3P=E7Bzj3RvBPpst6cCFTWcQ@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio] RE: [virtio-comment] proposal: use admin command (and
 aq) of the device to query config space

On Wed, Aug 2, 2023 at 5:07=E2=80=AFPM Parav Pandit <parav@nvidia.com> wrot=
e:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, August 2, 2023 2:23 PM
> >
> > On Tue, Aug 1, 2023 at 3:09=E2=80=AFPM Parav Pandit <parav@nvidia.com> =
wrote:
> > >
> > > One line proposal:
> > > Let's use new admin command and admin q for all device types to query
> > device config space for new fields. (always).
> >
> > Before we mandate anything to admin command, we need to first invent an
> > admin command over MMIO interface otherwise it would always be an issue
> > for the nesting.
> >
> Nesting can be independent requirement in itself.'

I don't understand here. If you tie new fields to the DMA interface,
it basically means nesting won't get any new features unless:

1) it's a PCI VF
2) SR-IOV emulation is done
3) admin virtqueue emulation is done

If you want differ nesting devices from others, it would be a
nightmare to maintain.

> > >
> > > Details below.
> > >
> > > Query of device capabilities and configuration using DMA interface.
> > > Need:
> > > Currently device configuration space is exposed as read only register=
s.
> >
> > This is wrong:
> >
> > 1) device configuration space is transport independent, some transport =
already
> > use DMA to access the device configuration space
> You can say ccw instead of "some". :)

Kind of but the transport vq proposal goes in the same way.

>
> > 2) device configuration space is not read only, we've already had sever=
al
> > examples of using it as write
> >
> It is even worse to have writable.

Well, what I meant is that, it's not necessarily read only and not
necessarily a register interface.

>
> > > It is growing rapidly.
> > > Some devices may be even multi-functionality device in coming future =
such as
> > net + clock + rdma device.
> > > For a PCI transport implementing such ever-growing capabilities,
> > configuration is burdensome as plain registers.
> >
> > We've already fixed size VIRTIO_PCI_CAP_PCI_CFG. What's wrong with that=
?
> >
> The wrong part is: it is still and indirect and slow, sub-optimal registe=
r interface.

Do we really care about the performance here? And if it is one of your
major concerns, it's better to explain it along with the
"ever-growing" concern.

>
> > And we have a lot of device specific virtqueues that could be used for
> > configuration.
> >
> Sure, this is the option_3 listed in here.
>
> > > Hence, it is required for the driver to query capabilities and config=
uration
> > using a DMA interface.
> > >
> > > Interface requirements:
> > > 1. Maintain backward compatibility for existing defined configuration=
 fields to
> > stay as registers.
> > > 2. Any new field added must be accessed via DMA interface, regardless=
 of
> > device implementation (hw/sw etc).
> > > Results in single driver code regardless of device implementation.
> >
> > Virtio is flexible as it decouples transport from the device model.
> > This breaks this flexibility, and this prevents non-DMA transport from =
being
> > developed.
> >
> VQ is decoupled from transport already.
> So, there is no flexibility broken.
> And yet you suggested transport dependent VIRTIO_PCI_CAP_PCI_CFG above ma=
king it further wrong. :)
>

The context here is that you want to mandate any new fields to be DMA.
DMA is obviously transport specific. There are transports that don't
use DMA at all (e.g the shared memory).

> > > 3. A device must be able to choose, starting from which field driver
> > > must query such configuration via DMA interface. This field offset mu=
st be
> > greater than currently defined configuration field.

[...]

> > >
> > > d. Any other option?
> >
> > Transport virtqueue on top of admin virtqueue will address this seamles=
sly.
> >
> :)
>
> Don=E2=80=99t see why one would create few more objects on top of aq when=
 aq or cvq itself can fulfil the need.
> Can you please elaborate?

If cvq can work, there's no need for any other methods. If you care
about admin virtqueue then device configuration space is not the only
thing that can be "ever growing", common_cfg is another one. Allowing
them to be accessed via a virtqueue (thus DMA in PCI transport) is
basically the idea of the transport virtqueue. Ling shan is rebasing
transport virtqueue proposals on top of admin commands, we can see
then.

Thanks


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


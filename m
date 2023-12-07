Return-Path: <virtio-comment-return-8760-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27961C4167B
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 05:35:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DD40971CB6
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 05:35:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CC67898690F
	for <virtio-comment@archiver.kernel.org>; Thu,  7 Dec 2023 05:35:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C237A98402B; Thu,  7 Dec 2023 05:35:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B51AA9868FD
	for <virtio-comment@lists.oasis-open.org>; Thu,  7 Dec 2023 05:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 8j8UN2tiMLyydpJAhiHLnQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701927342; x=1702532142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JV3lwJ9MCw0XkzgAQl6MVcD2o1R3081jkFbTcpzA+vI=;
        b=F59cXFSsIc23zIl59eAVni6ARncIa7oS51IRRxmZMFUaOT2ZFOvtpiR7NwV+va7XN3
         CsoDt1Phni4s3BwYYLymvrPxs1lkGdBz//cWTLxMd3CoIF9DgIw1S61CyFXuhbUXF7rd
         S3LazYyFQp3Sed0hoizWTIB4HakJrS4jODPkZZshxhFC9Oq7IsebCLf1GBSCiukxd1vJ
         23h2VehwId/dSePOhGpVpXl5fuPdtzlrFl38dRIpCZTHxDQ2U9LN079RzhQnKhxJ91P6
         1gUqVVcrTsLcQX8aczyLtX9lrVzMvbO87bp45CpJfG4DtMDDQmqzj5elORdvZ/TJYxQm
         ts0A==
X-Gm-Message-State: AOJu0Yx4BGMW2HXZoeEiRlRYlCgDtpZxrLnpy28YB8UvrExUJ7ndTYv3
	HGWWFhel/Syp/XMIWLjqygiEDX3KfueHRy/cPWwdGGTFV/AOOkHATgHeTDrJ8Foq4CYpS0t7JL7
	WnuKYXOyg2oktt1XjK6C4AobGvkOR50K4m5UIGGraeXxD0GboYg==
X-Received: by 2002:a17:90a:5c:b0:286:448f:610 with SMTP id 28-20020a17090a005c00b00286448f0610mr1656829pjb.2.1701927341717;
        Wed, 06 Dec 2023 21:35:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2mT0XfKh7btJQ9Cu3EcT+GZugx4fbjk+0WMoBfIvbWsVaIwjTXeE171cfK2fzyF0ysdZfn0z98k5R/LXO11I=
X-Received: by 2002:a17:90a:5c:b0:286:448f:610 with SMTP id
 28-20020a17090a005c00b00286448f0610mr1656822pjb.2.1701927341394; Wed, 06 Dec
 2023 21:35:41 -0800 (PST)
MIME-Version: 1.0
References: <20231204094123.856214-1-stevensd@chromium.org>
 <20231204094123.856214-2-stevensd@chromium.org> <CACGkMEuHLs=+8_RHVa9eTXfHLqo_Ra6hSrnT9k8DAG_0yz0pvQ@mail.gmail.com>
 <CAD=HUj6bBOOCWmrbxBHKymfAr3UVUL7S57FtffHi0vEzVmewDA@mail.gmail.com>
 <CACGkMEuGY9y5Zt9UdL+4V3tntnR4EyHHCRqX_P4QtmAOL0-Pew@mail.gmail.com>
 <20231206051652-mutt-send-email-mst@kernel.org> <CACGkMEvKo-c0XNRyJSrbkrgqLrWdXc9sju1JHx=y8QOLYCfffw@mail.gmail.com>
 <CAD=HUj4A_xvgD09OqvTVW8s4cieP3qFZBy0bXe=+FA028d5CoA@mail.gmail.com>
In-Reply-To: <CAD=HUj4A_xvgD09OqvTVW8s4cieP3qFZBy0bXe=+FA028d5CoA@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 7 Dec 2023 13:35:29 +0800
Message-ID: <CACGkMEsAE7g3k7=9MS2jh2PZ54-0HZ355ALvq-EGj7ghgbNLPA@mail.gmail.com>
To: David Stevens <stevensd@chromium.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio-comment@lists.oasis-open.org, 
	virtio-dev@lists.oasis-open.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v3 1/1] Define a low power mode for devices

On Thu, Dec 7, 2023 at 12:55=E2=80=AFPM David Stevens <stevensd@chromium.or=
g> wrote:
>
> On Thu, Dec 7, 2023 at 1:16=E2=80=AFPM Jason Wang <jasowang@redhat.com> w=
rote:
> >
> > On Wed, Dec 6, 2023 at 6:17=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Wed, Dec 06, 2023 at 05:16:04PM +0800, Jason Wang wrote:
> > > > On Tue, Dec 5, 2023 at 6:58=E2=80=AFPM David Stevens <stevensd@chro=
mium.org> wrote:
> > > > >
> > > > > On Tue, Dec 5, 2023 at 1:18=E2=80=AFPM Jason Wang <jasowang@redha=
t.com> wrote:
> > > > > >
> > > > > > On Mon, Dec 4, 2023 at 5:41=E2=80=AFPM David Stevens <stevensd@=
chromium.org> wrote:
> > > > > > >
> > > > > > > Define a low power mode for virtio devices where the devices =
are
> > > > > > > expected to maintain their state. This gives drivers an optio=
n for power
> > > > > > > management besides simply resetting their device. In the virt=
ualization
> > > > > > > use case, this allows the guest to be suspended even with sta=
teful
> > > > > > > virtio devices like gpu and fs.
> > > > > > >
> > > > > > > Low power mode is primarily defined at the transport layer. T=
he only
> > > > > > > part that depends on device-type specific details is whether =
a given
> > > > > > > virtqueue is device driven or driver driven.
> > > > > > >
> > > > > > > This change only defines the transport-specific implementatio=
n for
> > > > > > > Virtio over PCI.
> > > > > >
> > > > > > A dumb question, if this is only for PCI, can the device just
> > > > > > implement no_soft_reset via PMC?
> > > > >
> > > > > This is basically No_Soft_Reset, yes. If a change similar to [1] =
would
> > > > > be acceptable based only on the No_Soft_Reset bit even with no co=
ncept
> > > > > of power management in the virtio spec, then I personally don't h=
ave
> > > > > any problems with that.
> > > > >
> > > > > [1] https://lore.kernel.org/lkml/20231113055138.117392-1-stevensd=
@chromium.org/
> > > >
> > > > So if I read the code correctly, the current Qemu advertises PM but
> > > > without no_soft_reset.
> > > >
> > > > So this patch seems to break e.g virtio-net and doesn't fix virtio-=
GPU.
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > -David
> > > > >
> > >
> > > what is the breakage exactly?
> >
> > It looks to me we need:
> >
> > 1) Device side, if device can preserve state on d3hot, it may
> > advertise no_soft_reset
> > 2) Driver side, if driver sees no_soft_reset, it doesn't need to
> > manually suspend and resume. But in the above patch, it only checks
> > the existence of PM, it looks to me it needs to check no_soft_reset
> > instead.
>
> Right, my original reply was needlessly vague. Similar to the linked
> patch, but based on checking No_Soft_Reset instead of just pm_cap.

Right, so I think I'm fine if it works like this.

>
> That also raises the point that the proposed spec changes are also
> insufficient - the PCI section needs to say that setting No_Soft_Reset
> is required for low power mode.

Yes, but I think we probably don't need the spec patch.

Thanks

>
> -David
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


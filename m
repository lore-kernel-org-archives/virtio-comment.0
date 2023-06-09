Return-Path: <virtio-comment-return-6278-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D58C7EE23
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:56:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D9EAE2B02A
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:56:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C695F98668F
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:56:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B670298668D; Fri,  9 Jun 2023 02:56:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A3CD298668E
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Jun 2023 02:56:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zAvKB6puNJGuyzpMJDr_QA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686279403; x=1688871403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tw22uKipFiN723hfK7WVaBvdMz5sCqb+ockxowzwyo=;
        b=Pwy2xO4rQh2X98IbYG1XllmytwKg0iLvCxCw7K6uUvmMA+TE9VllfMqiPxNqYESADg
         pLTejgFxEa0w2M9H4cNrLi80ywq9+o0Z9wJ2qpqQpKlwiS9Reln6Nwkx6V8egTnVq7SY
         x5/bjwBL2lgjVm6bNSt3eFZ3dajvW3GfG3QT/dZReoDSqBsUndBIs4n6DxKGW1OzwDj9
         HuEPHQXC62j1FBaIASH+6nw3FITOh8Xq2uULWLNAcPEMInVdOvZjQoRMOFhxIYeIUGO3
         v5aX5b7RG/hYXeS/FBWDdE4PltnI0iycW1Q2SwhMQZfSZOjEsEFbKfVQETRoxDI/nKl8
         RqDg==
X-Gm-Message-State: AC+VfDzlzvqcZ9YNFJorXoPACvn88NZT1gttzixe1MJIZFUZNkPwBf0o
	9cIaYEjRjB4kn+KqIv0pigT1/eDugbX8KzilvpwCvmMHrSuoIfJ9Nma+/ha5rxtjj4FSmypzKmM
	QG+PwtB/1mkZtbthcHpjILPzbhXq256/1LKdfrzhEJ1hA1iG77A==
X-Received: by 2002:a2e:8ed6:0:b0:2b1:c5c5:192c with SMTP id e22-20020a2e8ed6000000b002b1c5c5192cmr196079ljl.44.1686279403159;
        Thu, 08 Jun 2023 19:56:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4BLE3uNnY6Yf1Y/g8V01c7TsfDDQNO+Nq0pIzla3oNNf0yeNUOVtmuzEa61VsVKLbBC19AbKv9nhGLWzn9i7M=
X-Received: by 2002:a2e:8ed6:0:b0:2b1:c5c5:192c with SMTP id
 e22-20020a2e8ed6000000b002b1c5c5192cmr196074ljl.44.1686279402873; Thu, 08 Jun
 2023 19:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230604105027-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B721C34D85D63FCC1F3DDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230604174224-mutt-send-email-mst@kernel.org> <PH0PR12MB5481DABA25CA36A5460B13E5DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605014539-mutt-send-email-mst@kernel.org> <PH0PR12MB5481C14D65D5E10CD23A9F67DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605092859-mutt-send-email-mst@kernel.org> <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org> <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org> <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
 <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsy=pG=LT0hOT-PO3HTkk3NOAu6qA_GaZpKwqq8B996cA@mail.gmail.com>
 <PH0PR12MB5481B197049376E7C4D0112EDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsPjwgx=atOC1ww+RnfJcrg7m2CmMXWQCCoreCwsWVpLg@mail.gmail.com> <PH0PR12MB54817C027CB2B7BB74BD35EDDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54817C027CB2B7BB74BD35EDDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Jun 2023 10:56:31 +0800
Message-ID: <CACGkMEsGA4ZhOPn5OCTZEZkja2UrLpJ8DXH+d62Fp5rtdicseg@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Fri, Jun 9, 2023 at 10:53=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, June 8, 2023 10:43 PM
>
> > > It is passthrough device, none of the 1.x objects are accessible or m=
ediated by
> > the hypervisor.
> >
> > Let me quote my reply once again:
> >
> > "
> > Hypervisor just need to prepare
> >
> > 1) legacy BAR with legacy config and device configuration space
> > 2) modern BAR with modern capabilities (common cfg and device cfg)
> >
> This is what is done in v5.

I meant this could be done with _F_LEGACY_HEADER/MAC as well.

>
> > For 2) it could be mapped directly to guest without any mediation For
> > 1) hypervisor needs to mediate
> > "
> >
> > There's zero mediation for 1.x objects at all. No?
> >
>
> > For accessing 1.x objects by hypervisor, what's wrong with that especia=
lly
> > considering it is used for legacy mediation only but not modern?
> I didn=E2=80=99t follow the question.
>
> > (Btw, how do
> > you define 1.x objects, isn't any facility via adminq an 1.x object?)
> >
> 1.x objects of the passthrough VF device.
>
> > In order to converge the discussion, maybe you can explain which one of=
 your 3
> > use cases and why can't work with _F_LEGACY_HEADER + _F_LEGACY_MAC.
> Hypervisor does not involve in feature negotiation and device life cycle =
phase so it cannot negotiate it.

With  _F_LEGACY_HEADER + _F_LEGACY_MAC, hypervisor doesn't need to be
involved in the feature negotiation for modern devices as well.

Anything I missed?

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


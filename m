Return-Path: <virtio-comment-return-6276-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489A0C7EE23
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:42:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id A337B339BA
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:42:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96A4B9867C9
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:42:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8D54798668E; Fri,  9 Jun 2023 02:42:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7CDC398668F
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Jun 2023 02:42:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: FLZ8RXdINAaAgt9FXy_Niw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686278568; x=1688870568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2gbB1v/3hccDKHMebrtDi5myR+Hde1YlFQox38jpFw8=;
        b=RhCF45QG+JA3LzQr5Oa1SqeI+36uz1ncn5rL2U9pMa+XHTkTKPJtw7wLgH0sQpMr3B
         RhZpJVw6N/t/2R00M2BsAuBssJVGwMXPzW5mlgQqyP32Lsc0eZhwR53Kz7K3QxUuhwMP
         LH7LNUtLw8ITCio6ZimIjmKmy8rjZdQ5EkYK/iNXXGO+yRvjAogbyBtn/LMuALZtsaFl
         UxH6ISlxkzReb5qNk/sZ57Kt6ot+VVLBBcLh/VaFc2LepCvpN7Pv6sV1CCjrRQz+ZpAu
         FKRTY0m5Ood2vG/FJ5kDq0bLUBJ9ouNhaSfpRtyBsqo2xTAxQ+E8RXnS6kupfQMZm6kZ
         hfQQ==
X-Gm-Message-State: AC+VfDxr1iWNZWRtBXHJ+EF08gjryUwuVcmAuYkARnnn/HDueaQPpyML
	dHuqvUPGBwfLhb1nIZzqG5HCbty4NZEAcqiVZoesUJnp4TG2bGaTPyYYtfEWjG6NHI8qCOkKqqw
	GYOsSyiigyHTpQ8PvLtSg/4FKWgmoNpVL4cryLkuYTfYBZX+z/Q==
X-Received: by 2002:a2e:9183:0:b0:2af:23c2:5dce with SMTP id f3-20020a2e9183000000b002af23c25dcemr208147ljg.25.1686278568104;
        Thu, 08 Jun 2023 19:42:48 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6+9DTTeS8wa58bq4DKyGlIr9KVMWF+pjESYd0acKhTpi6yb+1UaDZLh5Oj3PEstuGitPziCSAqRCQ7Ro6BsaE=
X-Received: by 2002:a2e:9183:0:b0:2af:23c2:5dce with SMTP id
 f3-20020a2e9183000000b002af23c25dcemr208135ljg.25.1686278567687; Thu, 08 Jun
 2023 19:42:47 -0700 (PDT)
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
 <CACGkMEsy=pG=LT0hOT-PO3HTkk3NOAu6qA_GaZpKwqq8B996cA@mail.gmail.com> <PH0PR12MB5481B197049376E7C4D0112EDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481B197049376E7C4D0112EDC51A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Jun 2023 10:42:36 +0800
Message-ID: <CACGkMEsPjwgx=atOC1ww+RnfJcrg7m2CmMXWQCCoreCwsWVpLg@mail.gmail.com>
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

On Fri, Jun 9, 2023 at 10:29=E2=80=AFAM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Thursday, June 8, 2023 10:07 PM
>
> > I think not since you fail to explain why this approach is better than =
simply
> > adding new features like _F_LEGACY_HEADER and _F_LEGACY_MAC.
>
> Please refer back to the requirements of cover letter and multiple past d=
iscussions.
> And Michael also explained...
>
> It is passthrough device, none of the 1.x objects are accessible or media=
ted by the hypervisor.

Let me quote my reply once again:

"
Hypervisor just need to prepare

1) legacy BAR with legacy config and device configuration space
2) modern BAR with modern capabilities (common cfg and device cfg)

For 2) it could be mapped directly to guest without any mediation For
1) hypervisor needs to mediate
"

There's zero mediation for 1.x objects at all. No?

For accessing 1.x objects by hypervisor, what's wrong with that
especially considering it is used for legacy mediation only but not
modern? (Btw, how do you define 1.x objects, isn't any facility via
adminq an 1.x object?)

In order to converge the discussion, maybe you can explain which one
of your 3 use cases and why can't work with _F_LEGACY_HEADER +
_F_LEGACY_MAC.

Thanks

>
> Cannot repeat more.


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


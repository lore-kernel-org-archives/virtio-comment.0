Return-Path: <virtio-comment-return-8069-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9F2BC4332F
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:42:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1AAB671C8D
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:42:55 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id ED1E6986B9C
	for <virtio-comment@archiver.kernel.org>; Wed,  1 Nov 2023 00:42:54 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D6016986B95; Wed,  1 Nov 2023 00:42:54 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6C6D986B96
	for <virtio-comment@lists.oasis-open.org>; Wed,  1 Nov 2023 00:42:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: UXglxHHkPv2nput3UDRh6w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698799370; x=1699404170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sXk1bdhdJNpXRKmQQ2Ac++N6I9RWFlvBXt4CQKUh1NY=;
        b=j+dnifTkT5Yxa4OfOb4eDbL+bB9MI3ggxxMQmAz1YfJNL8/S3Pla6Qqz/g4/XE/eD7
         hs1vJZxQsRT/EfZa+Vn5R2WJ2BulwvTArHgNaz33v6yHokqGboKj28nw8PEj4CM0aN1L
         20EakSMimMflC5td4UOlZPw/ZeFazudiUaSNdpr3YnhYwOano6IfV/V5YN+y8pRHjO94
         wnhe0Bn8XMI/QUt+22guz5F6k3aQ/1Fvw8WenXE3mSZshKhWMCspzkgkEsSitnnBaqYX
         2/VkvkpqkB1XuO9usO1fIQid/40oQZgPYfybFi/g+frBCYt/FgL5BoyINjnH3Jj0CkW6
         OjZA==
X-Gm-Message-State: AOJu0YzJ0P4WT2kuzz0oDfIo3wOdHbuMs9fYylksZYoeJdxORxlQGKk3
	QjqW/FuMX63Pdx7Hq4yJzdLXH0qSLSG5Cw3nSHejAL/vFg+7csC71Umn9mik1sNvPTFx7+DMcxM
	qJXgZt9sLlxXu/eTIbvlHcVRPQoZ+UWaT2vRrd4nZ8Z66JocdzA==
X-Received: by 2002:a19:3812:0:b0:507:96fd:d3ee with SMTP id f18-20020a193812000000b0050796fdd3eemr9491578lfa.32.1698799370434;
        Tue, 31 Oct 2023 17:42:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFes9+v3r/aDt4fgqDETlC40LG7ul9v9xlC7vqTJzl8Vu2luq13t+LEiHLDtWPykGZQ2ApE5fKnrXwql+jac0g=
X-Received: by 2002:a19:3812:0:b0:507:96fd:d3ee with SMTP id
 f18-20020a193812000000b0050796fdd3eemr9491562lfa.32.1698799370056; Tue, 31
 Oct 2023 17:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com> <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com> <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <09996f68-2831-49b0-a403-1ea061bea6eb@intel.com> <PH0PR12MB548147B94D76EF02EF42A9B1DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <341b7a16-6927-412e-8a22-4841cd419314@intel.com> <PH0PR12MB54813BF8D0F6282A1932EF99DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <640cc639-6065-4828-ac81-0cc809aff293@intel.com> <20231031054617-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231031054617-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 1 Nov 2023 08:42:38 +0800
Message-ID: <CACGkMEu1=HCdy5NpKfTNdxe0FvDoFaqdGmtA7z5LqrnFtXmMSg@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Tue, Oct 31, 2023 at 6:14=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 31, 2023 at 05:42:29PM +0800, Zhu, Lingshan wrote:
> > > Your answer is not relevant to this discussion at all.
> > > Why?
> > > Because we were discussing the schemes where registers are not used.
> > > One example of that was IMS. It does not matter MSI or MSIX.
> > > As explained in Intel's commit message, the key to focus for IMS is "=
queue memory" not some hw register like MSI or MSI-X.
> > you know the device always need to know a address and the data to send =
a
> > MSI, right?
>
> So if virtio is to use IMS then we'll need to add interfaces to program
> IMS, I think. As part of that patch - it's reasonable to assume - we will
> also need to add a way to retrieve IMS so it can be migrated.
>
> However, what this example demonstrates is that the approach taken
> by this proposal to migrate control path structures - namely, by
> defining a structure used just for migration - means that we will
> need to come up with a migration interface each time.
> And that is unfortunate.
>
> Compare to the trap and emulate approach for config space and we don't
> need a new interface, we just make each field R/W.
> So I feel this is something to think about, and address.
> Ideas?

Something like we've done for transportq in the past? (by just adding
the get commands):

https://lore.kernel.org/all/29533940-0345-4a84-fcc7-f42d914dc28d@intel.com/=
T/#mbfe209b96e1dda88ed7aae04d25b12026a7b5364

Thanks

>
> --
> MST
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


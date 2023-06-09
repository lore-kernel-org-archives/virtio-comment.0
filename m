Return-Path: <virtio-comment-return-6274-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F3CC7EE29
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:07:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 826576D0B
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:07:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7BE5698669D
	for <virtio-comment@archiver.kernel.org>; Fri,  9 Jun 2023 02:07:01 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 72EBC9842E9; Fri,  9 Jun 2023 02:07:01 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6306A98668D
	for <virtio-comment@lists.oasis-open.org>; Fri,  9 Jun 2023 02:07:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Ta7tQUjGNcylFOSa82gB2Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686276415; x=1688868415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LkD5yHjRHRAJLHdRCitoaW+ciw33OMihO26f3FWvzEA=;
        b=dTfqxO3+nzXtXSJLtdEsIN35/PouxXbq90IavTLZj3+FSblCwshCHXqPzJ0F0rnA1r
         UgT4BxAB1gt91WDVhPFu8oDRon6hqdp4dhXHCEEti57zF4DuO0z5F+sWVcEfgxpG2/Z7
         LoM/ycGf6C/EnKuLKKl9if7SNHPOnPWZTNCDSkTsb+fzX2YYcE1P7/m2D0j4pyZaQaiE
         UwPS4HfL3PQTsnU5q4KFQ+2zjtWDOp+XAYxerXYVktGwIP9pvoTVTid1o10a/uvJmNCZ
         epePHjz8OSXHg79424ye4vasFafyMBH+W96iNwSZIFFKwB4Whky9iaFeBNzNWBl7Ohj9
         LTOg==
X-Gm-Message-State: AC+VfDwHHrj64UEi9G+OIUoXfg5MGo0MgPI8QocwVBZGliZhws2CFpbs
	Rp1ANXP4E+T5g+zykBPSWW7YOnubQ1NJzHhYYX38elFz/X3kgODwd9i2iH3S7MlE/tcRqJHY1Ot
	To5qONYKUw5aHVDwvg4fYmeF0irWxHZu9DCCg0jLzITIieeWlmQ==
X-Received: by 2002:a05:6512:614:b0:4f5:a181:97b8 with SMTP id b20-20020a056512061400b004f5a18197b8mr20793lfe.25.1686276415676;
        Thu, 08 Jun 2023 19:06:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pkjHpYV/8n5W7rrMqS0I9dK/mToSHCPTJiN7cCL6gg2lCaf2anYY3+jqybPowcNyl0pkdPNRyZc0S4etAAgk=
X-Received: by 2002:a05:6512:614:b0:4f5:a181:97b8 with SMTP id
 b20-20020a056512061400b004f5a18197b8mr20782lfe.25.1686276415362; Thu, 08 Jun
 2023 19:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230604105027-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B721C34D85D63FCC1F3DDC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230604174224-mutt-send-email-mst@kernel.org> <PH0PR12MB5481DABA25CA36A5460B13E5DC4CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605014539-mutt-send-email-mst@kernel.org> <PH0PR12MB5481C14D65D5E10CD23A9F67DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605092859-mutt-send-email-mst@kernel.org> <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org> <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org> <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com> <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54810313CA6DD1995F52745DDC50A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 9 Jun 2023 10:06:43 +0800
Message-ID: <CACGkMEsy=pG=LT0hOT-PO3HTkk3NOAu6qA_GaZpKwqq8B996cA@mail.gmail.com>
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

On Thu, Jun 8, 2023 at 10:38=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, June 7, 2023 2:54 AM
>
> > Hypervisor can trap the legacy device configuration space write and con=
vert it
> > to cvq commands.
> Michael already answered that cvq is not trapped; this is the main design=
 goal we talked several times that it is passthrough device.

Is this really a blocker? Wouldn't a new feature(_F_LEFACY_MAC) or cap
resolve this?

>
> So no point discussing this again.
>
> If you have any comments on v4, please let me know.
>
> Both the design points are addressed in v4.
> 1. To split to two commands for device and config area
> 2. Use pci cap to learn about notification region
>
> Since this ABI reflects what we agree on,

I think not since you fail to explain why this approach is better than
simply adding new features like _F_LEGACY_HEADER and _F_LEGACY_MAC.

Thanks

> I would want to raise for vote in coming days to be part of 1.3 in few da=
ys as we have more than 3 weeks to sort out non-ABI language part.


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


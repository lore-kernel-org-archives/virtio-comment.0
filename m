Return-Path: <virtio-comment-return-8484-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E199C54FB9
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:23:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7E5C92AC4E
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6D496986889
	for <virtio-comment@archiver.kernel.org>; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 625FD98413B; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 544F2986874
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Nov 2023 04:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: zCAul-TfNwerzX3RacFSkA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700540591; x=1701145391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miasUKh5uLJw5bcoFdJxbXYmIY3yiVldNQ6eHJaUQ0Y=;
        b=A/XZzXehlSaoj+JI0fxcM3QzjZhxq98pp66sKh2ayuog+D+u9y6NW4W1HZyqlGJixU
         bQjELirzO8UcKsNbJWRo1kpNbrRnEQEB/QKagV2jjAz2/BXXAOpU0tyuTHhOvpVmYGrR
         3sK8a6rF3fQ8WZiErYt4Xdn5RZJOL+CoVSdiwBRVRo5E2EaZqvM8prAZ5YEfFRU2fjUe
         xEtsmPvfZ8ACa9E1rqWEgeJbZ4N/Chll9odP/ZadvHHrJ7/uONZJDQfELotlYd2hT7Za
         vkeq2G3gt9Av+XQ0m/q6XxON/6SmGRY9i3pK6UbUGpds34WFAqolSQTQd91RzjnFRF2A
         XiZQ==
X-Gm-Message-State: AOJu0YzUwuKJo/OEKeLO4xUlOmvf9cjZ+Nlx/TpIrenP/dtEcGzuoi41
	WDmO+S/70QBnj/kKOgs811W1eWUE7uyDzdOeW1hPmLXA90wiW44KTTrYGLLYzgJtgoa+YfZ70Sq
	cCYnHRPp12mjjSmQ//v4rYaIj/9tVGVz9NjRgsbZ8rq0wmBYSCg==
X-Received: by 2002:ac2:4567:0:b0:507:a1dd:5a86 with SMTP id k7-20020ac24567000000b00507a1dd5a86mr6128932lfm.13.1700540591469;
        Mon, 20 Nov 2023 20:23:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3us9aCozb52KkX9b2V7Rn/SA4P38RGXKYjVRoGzfulJU4Zq5lg5AlE36tKSxDXNhbGTgs9zBBzQfFNtdTshQ=
X-Received: by 2002:ac2:4567:0:b0:507:a1dd:5a86 with SMTP id
 k7-20020ac24567000000b00507a1dd5a86mr6128925lfm.13.1700540591161; Mon, 20 Nov
 2023 20:23:11 -0800 (PST)
MIME-Version: 1.0
References: <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116012208-mutt-send-email-mst@kernel.org> <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB54811F4CE5686AE4BEA826C1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 21 Nov 2023 12:22:59 +0800
Message-ID: <CACGkMEvU2sqVXAeEUykia2M-6rP1_nMemPH8eNZTEoHR0wUfog@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Nov 16, 2023 at 2:34=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
>
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, November 16, 2023 11:53 AM
> >
> > On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> > > You continue to want to overload admin commands for dual purpose, doe=
s
> > not make sense to me.
> >
> > dual -> as a transport and for migration? why can't they be used for th=
is? I was
> > really hoping to cover these two cases when I proposed them.
> For following reasons.
>
> 1. migration needs incremental reads of only changed context between two =
reads

This is wrong. We need to invent general facilities. I've pointed out
sufficient issues, and what's more delta doesn't work for the
following cases:

1) migration but fail the another try for migration
2) save vm state twice

It request a lot of tricks in hypervisor to do that (e.g cache the last sta=
te?).

>
> 2. migration writes covers large part of the configurations not just virt=
io common config and device config.

You invent a duplication of common_cfg structure no?

What's wrong if we just allow them to be R/W over adminq/cmmands?

> Such as configuration occurred through the CVQ. All of these is not neede=
d when done from guest directly via member's own CVQ.

That's the device type specific state which requires new commands
forsure. I don't see any connection. The SIOV device needs to be
migrated as well.

>
> For backward compatible SIOV transport, one may need them to transport wi=
thout above two properties.

Why, just mediate between virtual PCI and adminq.

>
> 3. None of this transport is needed for PFs, VFs and non-backward compati=
ble SIOVs.
> Each device to have its own transport that is not intercepted by the hype=
rvisor and follow the equivalency principle uniformly for all 3 device type=
s.

You can have per VF transport q, what's wrong with that?

Thanks

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


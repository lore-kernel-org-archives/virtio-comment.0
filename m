Return-Path: <virtio-comment-return-8517-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EDFC072A2
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:15:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CEB5D2AEDD
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:15:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C7FE198689A
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 04:15:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BC3C3986893; Wed, 22 Nov 2023 04:15:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AE976986894
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 04:15:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 411-vYfjOaOHtxfaDDqViQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700626508; x=1701231308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PGp412lihjlCRWh8YFyWt7QfbInVEWeQ0D35PBmwaSw=;
        b=nv4Qs4a537SHqMX/WJPUBgX1LX2Uw4CRADEUGWent2a2AmsHgAQ7hl9dNZHeiRhu/o
         2C0pi86TixtlFEM+VPooByhNYMwh8zxiuqwde58WOYqjXHVWQe0jgelVGz3LxzTONFfN
         fpN+s0es4PJxZx05335eHTbRzVyvRA2eeM5YcxJckmF3/Tlg+Ztkp/+ouF9/MeEqOQ5t
         YrzVFFZZqp1NSCV9dhblANJgkCEsFxNh5jKGg93JXOaPzngj6cgdtJPJPYGo9hJDeAZZ
         wNWY72boUUmtiEkAPm+Rtha6U2AMjeytPh8ZhGySJETII3xMEN+ndS68vF3kgCUN48d6
         XCjQ==
X-Gm-Message-State: AOJu0YzTtI/dP42wa7KRG4C1i0tKInv2byKScca8Iz7t1zX95CueKEkX
	Sj5PQ4cp8+dPZvS98eBeiamd/gi366G7Sbq76Z0CStllhVMY5cVkHg7Z9N+yzhqtos6ZBAJPYTy
	F9+j5FwckUp6InwAwaTOa4cThB3WVZ13xO5tLORR0POJO7BY4EQ==
X-Received: by 2002:a19:f708:0:b0:509:fc7:884a with SMTP id z8-20020a19f708000000b005090fc7884amr467137lfe.19.1700626507942;
        Tue, 21 Nov 2023 20:15:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgDpz5fd+IzcX51zpVk+9vb8oaATf3A0gWwtWdLKWURL5d29BgY64CyTvG6FFhwtcvhdF13ed04C3MGr2rk2M=
X-Received: by 2002:a19:f708:0:b0:509:fc7:884a with SMTP id
 z8-20020a19f708000000b005090fc7884amr467130lfe.19.1700626507614; Tue, 21 Nov
 2023 20:15:07 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org> <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org> <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org> <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org> <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvWK65GY_U4MMa6=43wqnM8T4-ALK07d7zEHp8Aa36wGg@mail.gmail.com> <PH0PR12MB5481D5A3FF96B355348A7F2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481D5A3FF96B355348A7F2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 22 Nov 2023 12:14:56 +0800
Message-ID: <CACGkMEurz8kxONQPTBcXzjnVLpBazNdjJwC6LQr-+Wm96fG=Hw@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Wed, Nov 22, 2023 at 12:26=E2=80=AFAM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, November 21, 2023 9:55 AM
> >
> > On Fri, Nov 17, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Thursday, November 16, 2023 11:51 PM
> > > >
> > > > On Thu, Nov 16, 2023 at 05:29:49PM +0000, Parav Pandit wrote:
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 10:56 PM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrote:
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Thursday, November 16, 2023 5:18 PM
> > > > > > > >
> > > > > > > > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit wrot=
e:
> > > > > > > > >
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > > > > > > > >
> > > > > > > > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S. Ts=
irkin
> > wrote:
> > > > > > > > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav Pandi=
t
> > wrote:
> > > > > > > > > > > > We should expose a limit of the device in the
> > > > > > > > > > > > proposed
> > > > > > > > > > WRITE_RECORD_CAP_QUERY command, that how much range it
> > > > > > > > > > can
> > > > > > track.
> > > > > > > > > > > > So that future provisioning framework can use it.
> > > > > > > > > > > >
> > > > > > > > > > > > I will cover this in v5 early next week.
> > > > > > > > > > >
> > > > > > > > > > > I do worry about how this can even work though. If yo=
u
> > > > > > > > > > > want a generic device you do not get to dictate how
> > > > > > > > > > > much memory
> > > > VM has.
> > > > > > > > > > >
> > > > > > > > > > > Aren't we talking bit per page? With 1TByte of memory
> > > > > > > > > > > to track
> > > > > > > > > > > -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > > > >
> > > > > > > > > > Ugh. Actually of course:
> > > > > > > > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit ->
> > > > > > > > > > 8Mbyte per VF
> > > > > > > > > >
> > > > > > > > > > 8Gbyte per *PF* with 1K VFs.
> > > > > > > > > >
> > > > > > > > > Device may not maintain as a bitmap.
> > > > > > > >
> > > > > > > > However you maintain it, there's 256Mega bit of information=
.
> > > > > > > There may be other data structures that device may deploy as
> > > > > > > for example
> > > > > > hash or tree or something else.
> > > > > >
> > > > > > Point being?
> > > > > The device may have some hashing accelerator or other improvement=
s
> > > > > that
> > > > may perform better than bitmap as many queues in parallel attempt t=
o
> > > > update the shared database.
> > > >
> > > > Maybe, I didn't give this thought.
> > > >
> > > > My point was that to be able to keep all combinations of dirty/non
> > > > dirty page for each 4k page in a 1TByte guest device needs 8MBytes
> > > > of on-device memory per VF. As designed the query also has to repor=
t
> > > > it for each VF accurately even if multiple VFs are accessing same g=
uest.
> > > Yes.
> > >
> > > >
> > > > > >
> > > > > > > And this is runtime memory only during the short live
> > > > > > > migration period of
> > > > > > 400msec or less.
> > > > > > > It is not some _always_ resident memory.
> >
> > When developing the spec, we should not have any assumption for the
> > implementation. For example, you can't just assume virtio is always emu=
lated
> > in the software in the DPU.
> >
> There is no such assumption.
> It is supported on non DPU devices too.

You meant e.g a 8MB on-chip resource per VF is good to go?

>
> > How can you make sure you can converge in 400ms without having a interf=
ace
> > for the driver to set the correct parameter like dirty rates?
>
> 400msec is also written anywhere as requirement if this is what you want =
to argue about.

No, the downtime needs to coordinate with the hypervisor, that is what
I want to say. Unfortunately, I don't see any interface in this
series.

> There is nothing prevents to extend the interface to define the SLA as ad=
ditional commands in the future to improve the solution.
>
> There is no need to boil the ocean now. Once the base infrastructure is b=
uilt, we will improve it further.
> And proposed patches are reasonably well covered to our knowledge.

Well, it is not me but you that claims it can be done in 400ms. I'm
wondering how and you told me it could be done in the future?

Thanks


>
> >
> > Thanks
> >
> > > > > >
> > > > > > No - write tracking is used in the live phase of migration. It
> > > > > > can be enabled as long as you wish - it's a question of policy.
> > > > > > There actually exist solutions that utilize this phase for
> > > > > > redundancy, permanently
> > > > running in this mode.
> > > > >
> > > > > If such use case exists, one may further improve the device
> > implementation.
> > > >
> > > > Yes such use cases exist, there is no limit on how long migration t=
akes.
> > > > So go ahead and further improve it please. Do not give us "we did
> > > > not get requests for this feature" please.
> > >
> > > Please describe the use case more precisely.
> > > If there is any application or OS API etc exists, please point to it =
where would
> > you like to fit this dirty page tracking beyond device migration.
> > > We may have to draw a line to have reasonable point and not keep
> > discussing infinitely.
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


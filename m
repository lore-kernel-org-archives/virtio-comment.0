Return-Path: <virtio-comment-return-8582-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1043DC61D97
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:09:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 66B4444550
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:09:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 4DFCD9868B7
	for <virtio-comment@archiver.kernel.org>; Fri, 24 Nov 2023 03:09:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 394D798660F; Fri, 24 Nov 2023 03:09:36 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 293289868A5
	for <virtio-comment@lists.oasis-open.org>; Fri, 24 Nov 2023 03:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: bDu7fQINNsGNSOk9656ghg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700795372; x=1701400172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd1bVf9zY2/THEnaM37qqqpPWSfHqByQ+hg83AO0S7w=;
        b=KcdWngiVNYHuk4+vTN4httWOgOhzSdLO+SI8v5LO+zxgOeV61ap4rYnMrmKCrKPpOc
         sNayzY0Iw7+j+eRn0DZALjLfBl+YJHfQ5cawSIGewtIrXwC9ZbKSgeTMpjUZ/mGQTnNf
         KFIFvqNJMc4chMZOM1OsPT6Zmb2uU3PknOR+ys68oQSj+J5KZv4+ynv9iJ0WEB0ddf7s
         Z15CDtvPRC26Zp/btvuglDQL8NcVOs/ie6xy+yt20gOYrmNxqlFyKIQbTjXniconCoW+
         lLAtE4p/rak10+r3vyKQAHV2wsv4J73ltvRHT8EDiQTALKVJ/0e/CZuOz5K4mnkEQunV
         3u1w==
X-Gm-Message-State: AOJu0YwnArhAguFUseTUJqdPOtcnpkXNNI3i6Rqqi5mHuie1Fx3YOFsZ
	3o9QKBeQ7QlwMhH5fsd885EGx2YCZlzHBXTW9DTXJp2CSgBZiiKE6KY3RtuwciAHULBXiA4t/vE
	5DN755Qpf3F75Xkk4Au/fJwPoTqD7vgrY8UOoViocOv6jkp1Gew==
X-Received: by 2002:ac2:46ca:0:b0:509:4a02:49f7 with SMTP id p10-20020ac246ca000000b005094a0249f7mr723672lfo.44.1700795371916;
        Thu, 23 Nov 2023 19:09:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQ9VhcWSZZDg8Br6dKv46KcYt5m192Dorei69dBDwNJ00568CVWHJ3uHnD5owo2EQUse/+hrF2qryJCllAr8M=
X-Received: by 2002:ac2:46ca:0:b0:509:4a02:49f7 with SMTP id
 p10-20020ac246ca000000b005094a0249f7mr723663lfo.44.1700795371555; Thu, 23 Nov
 2023 19:09:31 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54810AFC15EAC51755CFC045DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtP+W4mdfn5PszoSHW3tNS+KPAMKXvJhpWKa_NchxVpZA@mail.gmail.com>
 <PH0PR12MB54815F616E0CF024927984C2DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116004037-mutt-send-email-mst@kernel.org> <20231116023443-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548118E76BAFD5FA470B92A1DCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116064611-mutt-send-email-mst@kernel.org> <PH0PR12MB54814EC9577B1197E2A13BDBDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116121958-mutt-send-email-mst@kernel.org> <PH0PR12MB5481F4D1B07F2809AA7D7C9BDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231116131303-mutt-send-email-mst@kernel.org> <PH0PR12MB54818DBAE43A566C807E1AE9DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvWK65GY_U4MMa6=43wqnM8T4-ALK07d7zEHp8Aa36wGg@mail.gmail.com>
 <PH0PR12MB5481D5A3FF96B355348A7F2ADCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEurz8kxONQPTBcXzjnVLpBazNdjJwC6LQr-+Wm96fG=Hw@mail.gmail.com> <PH0PR12MB5481CFFD246EDAFE51304848DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481CFFD246EDAFE51304848DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 24 Nov 2023 11:09:20 +0800
Message-ID: <CACGkMEv5e_c9A8OuQX=4C1h-Pq+E04fx3_SnQKdOUJ0k78Rt6A@mail.gmail.com>
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

On Wed, Nov 22, 2023 at 12:19=E2=80=AFPM Parav Pandit <parav@nvidia.com> wr=
ote:
>
>
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, November 22, 2023 9:45 AM
> >
> > On Wed, Nov 22, 2023 at 12:26=E2=80=AFAM Parav Pandit <parav@nvidia.com=
> wrote:
> > >
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, November 21, 2023 9:55 AM
> > > >
> > > > On Fri, Nov 17, 2023 at 11:02=E2=80=AFAM Parav Pandit <parav@nvidia=
.com>
> > wrote:
> > > > >
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Thursday, November 16, 2023 11:51 PM
> > > > > >
> > > > > > On Thu, Nov 16, 2023 at 05:29:49PM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Thursday, November 16, 2023 10:56 PM
> > > > > > > >
> > > > > > > > On Thu, Nov 16, 2023 at 04:26:53PM +0000, Parav Pandit wrot=
e:
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Thursday, November 16, 2023 5:18 PM
> > > > > > > > > >
> > > > > > > > > > On Thu, Nov 16, 2023 at 07:40:57AM +0000, Parav Pandit
> > wrote:
> > > > > > > > > > >
> > > > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > > > Sent: Thursday, November 16, 2023 1:06 PM
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Nov 16, 2023 at 12:51:40AM -0500, Michael S=
.
> > > > > > > > > > > > Tsirkin
> > > > wrote:
> > > > > > > > > > > > > On Thu, Nov 16, 2023 at 05:29:54AM +0000, Parav
> > > > > > > > > > > > > Pandit
> > > > wrote:
> > > > > > > > > > > > > > We should expose a limit of the device in the
> > > > > > > > > > > > > > proposed
> > > > > > > > > > > > WRITE_RECORD_CAP_QUERY command, that how much
> > range
> > > > > > > > > > > > it can
> > > > > > > > track.
> > > > > > > > > > > > > > So that future provisioning framework can use i=
t.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > I will cover this in v5 early next week.
> > > > > > > > > > > > >
> > > > > > > > > > > > > I do worry about how this can even work though. I=
f
> > > > > > > > > > > > > you want a generic device you do not get to
> > > > > > > > > > > > > dictate how much memory
> > > > > > VM has.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Aren't we talking bit per page? With 1TByte of
> > > > > > > > > > > > > memory to track
> > > > > > > > > > > > > -> 256Gbit -> 32Gbit -> 8Gbyte per VF?
> > > > > > > > > > > >
> > > > > > > > > > > > Ugh. Actually of course:
> > > > > > > > > > > > With 1TByte of memory to track -> 256Mbit -> 32Mbit
> > > > > > > > > > > > -> 8Mbyte per VF
> > > > > > > > > > > >
> > > > > > > > > > > > 8Gbyte per *PF* with 1K VFs.
> > > > > > > > > > > >
> > > > > > > > > > > Device may not maintain as a bitmap.
> > > > > > > > > >
> > > > > > > > > > However you maintain it, there's 256Mega bit of informa=
tion.
> > > > > > > > > There may be other data structures that device may deploy
> > > > > > > > > as for example
> > > > > > > > hash or tree or something else.
> > > > > > > >
> > > > > > > > Point being?
> > > > > > > The device may have some hashing accelerator or other
> > > > > > > improvements that
> > > > > > may perform better than bitmap as many queues in parallel
> > > > > > attempt to update the shared database.
> > > > > >
> > > > > > Maybe, I didn't give this thought.
> > > > > >
> > > > > > My point was that to be able to keep all combinations of
> > > > > > dirty/non dirty page for each 4k page in a 1TByte guest device
> > > > > > needs 8MBytes of on-device memory per VF. As designed the query
> > > > > > also has to report it for each VF accurately even if multiple V=
Fs are
> > accessing same guest.
> > > > > Yes.
> > > > >
> > > > > >
> > > > > > > >
> > > > > > > > > And this is runtime memory only during the short live
> > > > > > > > > migration period of
> > > > > > > > 400msec or less.
> > > > > > > > > It is not some _always_ resident memory.
> > > >
> > > > When developing the spec, we should not have any assumption for the
> > > > implementation. For example, you can't just assume virtio is always
> > > > emulated in the software in the DPU.
> > > >
> > > There is no such assumption.
> > > It is supported on non DPU devices too.
> >
> > You meant e.g a 8MB on-chip resource per VF is good to go?
> >
> It is the device implementation detail. Maybe it uses 8MB, may be not.

So you leave a pandora box for the vendor to open and see? You are
debating 16 bit on chip resources but now you're saying 8MB can work
or not?

> And if you are going to compare again with slow registers memory, it is n=
ot apple to apple comparison anyway.

I never say using a register is a better way. Register is a transport
specific concept, you can't say it can work for all transports.

>
> Non DPU device may have such memory for data path acceleration.
>
> > >
> > > > How can you make sure you can converge in 400ms without having a
> > > > interface for the driver to set the correct parameter like dirty ra=
tes?
> > >
> > > 400msec is also written anywhere as requirement if this is what you w=
ant to
> > argue about.
> >
> > No, the downtime needs to coordinate with the hypervisor, that is what =
I
> > want to say. Unfortunately, I don't see any interface in this series.
> >
> What do you mean by coordinated?

I've given the equation that is used by Qemu to calculate the
downtime. It needs knowledge beyond the virtio, no?

Device needs to be throttled in a way that is under the expectation of
a hypervisor, otherwise the downtime can't be satisfied.

> This series has mechanism to eliminate the downtime on src and dst side d=
uring device migration during pre-copy phase.

I don't see how it can "eliminate" the downtime.

>
> > > There is nothing prevents to extend the interface to define the SLA a=
s
> > additional commands in the future to improve the solution.
> > >
> > > There is no need to boil the ocean now. Once the base infrastructure =
is
> > built, we will improve it further.
> > > And proposed patches are reasonably well covered to our knowledge.
> >
> > Well, it is not me but you that claims it can be done in 400ms. I'm won=
dering
> > how and you told me it could be done in the future?
> >
> In our tests it is near to this number.

You need to explain why it can, especially under heavy load.

> The discussion is about programming the SLA and that can be an extension.

Migrations have SLA naturally that is the downtime, you can't just
bypass it from the start of the design.

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


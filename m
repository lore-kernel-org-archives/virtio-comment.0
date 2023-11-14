Return-Path: <virtio-comment-return-8353-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC889C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:59:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3C63423546
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:59:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 207FF986D71
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:59:22 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 093F8986D66; Tue, 14 Nov 2023 07:59:22 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EE518986D67
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Nov 2023 07:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 4Fd1gxZiPLCSki-HBn-9sw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948756; x=1700553556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9QwJNVWZPlAcZTBoGh4eBkSOo0gfaQ9vy1EoeFcLy4=;
        b=H7GXzHRMb/qyUmE7b51JXmYmO4A8YdOuE7tbtA4tORCyAx/2A2Rng4hmna7nYrb5Nc
         Mm2NKVhy0D/gt49//NNNIKNgUE362aOpzvshnGepDxAfn1+KyvuusCk6hrzJqP5I7/hi
         UaJ7NM1gOXms36AJJzny5Uu2z/6PH9AdXhOuEdtCV8iGZfhYZUl8m8PyAo1Usl9CQSp8
         wLrlASkh/wZs4qx1VcAXWthlChsbM6DkUguU/ip//YcW4wThtTST21gmsrCSjNgNr0dX
         8qxXDsMrVmX7UyGQpdIMzjEaZQ82tp/sBzKy6uCtZWpb/RIawdwPCqtqKzAT068xNxNh
         2COw==
X-Gm-Message-State: AOJu0YzNDxL8WBJUbkbVQVFX1WkMyzUrMVS9Z6Qj6LqDM7ImtrGATtNu
	3Tg61bIXmkJcNNgd7O2VWRHebPgyUiPtmyYGzbyKec03eLFQmgz6ft0XUKPLiLooeP53abjWvFq
	agiOji/fYXxHEgjnZGU1rK4UrKVyTpyMj3o6txrHO8M2tdvllYQ==
X-Received: by 2002:a05:6512:485e:b0:504:3c1f:cbd1 with SMTP id ep30-20020a056512485e00b005043c1fcbd1mr5777958lfb.12.1699948756217;
        Mon, 13 Nov 2023 23:59:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG5wdSh5FzpgkSwkDIPnCOQvvwIn6cDQS4x25bHzKrTyZ9J4egIXzKsxqVNI/+o3JdaMbNKnr7kZUlAebhbOsQ=
X-Received: by 2002:a05:6512:485e:b0:504:3c1f:cbd1 with SMTP id
 ep30-20020a056512485e00b005043c1fcbd1mr5777944lfb.12.1699948755887; Mon, 13
 Nov 2023 23:59:15 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org> <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org> <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <20231113013016-mutt-send-email-mst@kernel.org> <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
In-Reply-To: <9952859f-1b72-46bf-b386-7c3f5c69269f@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Nov 2023 15:59:04 +0800
Message-ID: <CACGkMEvJhCB4nTWqfLKZptq-ig+NA2u6NT26uMyMFHrP0UiNwA@mail.gmail.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Tue, Nov 14, 2023 at 3:34=E2=80=AFPM Zhu, Lingshan <lingshan.zhu@intel.c=
om> wrote:
>
>
>
> On 11/13/2023 2:57 PM, Michael S. Tsirkin wrote:
> > On Mon, Nov 13, 2023 at 11:31:37AM +0800, Jason Wang wrote:
> >> On Thu, Nov 9, 2023 at 3:59=E2=80=AFPM Michael S. Tsirkin <mst@redhat.=
com> wrote:
> >>> On Thu, Nov 09, 2023 at 11:31:27AM +0800, Jason Wang wrote:
> >>>> On Wed, Nov 8, 2023 at 4:17=E2=80=AFPM Michael S. Tsirkin <mst@redha=
t.com> wrote:
> >>>>> On Wed, Nov 08, 2023 at 12:28:36PM +0800, Jason Wang wrote:
> >>>>>> On Tue, Nov 7, 2023 at 3:05=E2=80=AFPM Michael S. Tsirkin <mst@red=
hat.com> wrote:
> >>>>>>> On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> >>>>>>>>>>> Each virtio and non virtio devices who wants to report their =
dirty page report,
> >>>>>>>>>> will do their way.
> >>>>>>>>>>>> 3) inventing it in the virtio layer will be deprecated in th=
e future
> >>>>>>>>>>>> for sure, as platform will provide much rich features for lo=
gging
> >>>>>>>>>>>> e.g it can do it per PASID etc, I don't see any reason virti=
o need
> >>>>>>>>>>>> to compete with the features that will be provided by the pl=
atform
> >>>>>>>>>>> Can you bring the cpu vendors and committement to virtio tc w=
ith timelines
> >>>>>>>>>> so that virtio TC can omit?
> >>>>>>>>>>

[...]

> > On the other hand they have an extra CPU cost.  Personally if this is
> > coming from a hardware vendor, I am inclined to trust them wrt PCI
> > transactions.  But anyway, discussing this at a high level theoreticall=
y
> > is pointless - whoever bothers with actual prototyping for performance
> > testing wins, if no one does I'd expect a back of a napkin estimate
> > to be included.
> if so, Intel has released productions implementing these interfaces
> years ago,
> see live migration in 4.1. IFCVF vDPA Implementation,
> https://doc.dpdk.org/guides-21.11/vdpadevs/ifc.html
> and
>
> But I still believe we are here try our best to work out an industrial sp=
ec
> with better quality, to serve broad interest. This is not competition
> between companies,
> and the spec is not a FIFO, not like a early bird can catch all the worm.


This is my understanding as well.

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


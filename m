Return-Path: <virtio-comment-return-5324-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD49C77B6E
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 01:51:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 943BE68468
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 01:51:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7B4B0986366
	for <virtio-comment@archiver.kernel.org>; Mon, 10 Apr 2023 01:51:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 68A7D9843C6; Mon, 10 Apr 2023 01:51:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 567CB9862A5;
	Mon, 10 Apr 2023 01:51:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R571e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0Vfedqbj_1681091467;
Message-ID: <1681091265.2051864-1-xuanzhuo@linux.alibaba.com>
Date: Mon, 10 Apr 2023 09:47:45 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Wen Gu <guwen@linux.alibaba.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 virtio-comment@lists.oasis-open.org,
 hans@linux.alibaba.com,
 herongguang@linux.alibaba.com,
 zmlcc@linux.alibaba.com,
 dust.li@linux.alibaba.com,
 tonylu@linux.alibaba.com,
 zhenzao@linux.alibaba.com,
 helinguo@linux.alibaba.com,
 gerry@linux.alibaba.com,
 cohuck@redhat.com,
 jasowang@redhat.com,
 Jan Kiszka <jan.kiszka@siemens.com>,
 kgraul@linux.ibm.com,
 wenjia@linux.ibm.com,
 jaka@linux.ibm.com,
 hca@linux.ibm.com,
 twinkler@linux.ibm.com,
 raspl@linux.ibm.com,
 virtio-dev@lists.oasis-open.org,
 Alexandra Winter <wintera@linux.ibm.com>
References: <20230209033056.96657-1-xuanzhuo@linux.alibaba.com>
 <20230209033056.96657-2-xuanzhuo@linux.alibaba.com>
 <20230323154656.7f036d52.pasic@linux.ibm.com>
 <ff9b28a1-e0ee-f082-1f40-f3e149c9403e@linux.alibaba.com>
 <7a9ebec0-5e87-b80f-4f2c-c4db7ae4fe84@linux.ibm.com>
 <20230405084632-mutt-send-email-mst@kernel.org>
 <1680837735.392044-2-xuanzhuo@linux.alibaba.com>
 <20230407070820-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230407070820-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [virtio-comment] [PATCH v3 1/1] virtio-ism: introduce new device virtio-ism

On Fri, 7 Apr 2023 07:13:13 -0400, "Michael S. Tsirkin" <mst@redhat.com> wr=
ote:
> On Fri, Apr 07, 2023 at 11:22:15AM +0800, Xuan Zhuo wrote:
> > On Wed, 5 Apr 2023 08:52:14 -0400, "Michael S. Tsirkin" <mst@redhat.com=
> wrote:
> > > On Wed, Apr 05, 2023 at 02:39:53PM +0200, Alexandra Winter wrote:
> > > >
> > > >
> > > > On 24.03.23 05:03, Wen Gu wrote:
> > > > >
> > > > >
> > > > > On 2023/3/23 22:46, Halil Pasic wrote:
> > > > >
> > > > >> On Thu,=C2=A0 9 Feb 2023 11:30:56 +0800
> > > > >> Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > >>
> > > >
> > > > ...
> > > >
> > > > >
> > > > >> To get back to the things proposed here: the cdid is IMHO
> > > > >> a nice thing, and is functionally corresponding to the
> > > > >> (S)EID. But it is 16 byte wide, and I have no idea how
> > > > >> is it supposed to be used in the CLC handshake.
> > > > >>
> > > > >
> > > > > CLC handshake carry one SEID for all the SMC-D device. Considering
> > > > > coexistence with ISM, I am not sure whether we can change or incr=
ease
> > > > > the SEID.. cc Alexandra
> > > > >
> > > > > Thanks!
> > > > > Wen Gu
> > > >
> > > > As mentioned by others, discussions are ongoing.
> > > > It would be great, if we can agree on a way to use the existing CLC=
 handshake
> > > > for SMC-D via virtio-ism and ism-loopback.
> > > > In that case SEID needs to be unique per hardware instance, cannot =
be increased and
> > > > can only be changed for x86 in a non-colliding way.
> > > >
> > > > An alternative would be to define new a SMC-D(?) protocol variant/v=
ersion, where we
> > > > are free to define new fields (e.g. UUIDs).
> > > >
> > > > Alexandra
> > >
> > > Problem with tying to hardware is that it is blocking
> > > migration (which is a challenge with ism anyway, but still).
> >
> >
> > We don't want to support migration. At least we don't want to support i=
t for the
> > time being. Because there are indeed many problems. I think Migration i=
s not
> > necessary for a new Virtio device.
> >
> > Thanks.
>
> The specific implementation does not matter much. At the spec level we
> strive to make interfaces generic so they can be reused down the road,
> rather than having to invent new ones for each use-case.
> Maybe we can come up with a way that let devices choose either
> an existing one with a SEID or a new one with a UUID?

Yes. I agree this.

From the perspective of Virtio SPEC, we can provide some information for SM=
C. As
long as these requirements are reasonable. At present, @Wen is working in t=
his.

Thanks.


>
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


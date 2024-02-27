Return-Path: <virtio-comment-return-9153-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59FBC54798
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 09:16:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 452AF157EEA
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 09:16:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 20F739863E4
	for <virtio-comment@archiver.kernel.org>; Tue, 27 Feb 2024 09:16:13 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 074E7983D68; Tue, 27 Feb 2024 09:16:13 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id EC4789863B6
	for <virtio-comment@lists.oasis-open.org>; Tue, 27 Feb 2024 09:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: MKqflWGUPGyT81HHIY97zg-1
From: Cornelia Huck <cohuck@redhat.com>
To: Heng Qi <hengqi@linux.alibaba.com>
Cc: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 virtio-comment@lists.oasis-open.org, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>
In-Reply-To: <601c156a-8647-43b8-8517-3df9df4c529a@linux.alibaba.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <1704263702-50528-1-git-send-email-hengqi@linux.alibaba.com>
 <1705384341.865516-1-xuanzhuo@linux.alibaba.com>
 <c4fd63b3-5bdf-45e7-b846-3d858c3bd8ea@linux.alibaba.com>
 <601c156a-8647-43b8-8517-3df9df4c529a@linux.alibaba.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 27 Feb 2024 10:16:04 +0100
Message-ID: <871q8yclnv.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [virtio-dev] Re: [PATCH v8] virtio-net:
 correct conditions for devices to validate packet checksum

On Tue, Feb 27 2024, Heng Qi <hengqi@linux.alibaba.com> wrote:

> =E5=9C=A8 2024/2/20 =E4=B8=8A=E5=8D=8810:38, Heng Qi =E5=86=99=E9=81=93:
>>
>>
>> =E5=9C=A8 2024/1/16 =E4=B8=8B=E5=8D=881:52, Xuan Zhuo =E5=86=99=E9=81=93=
:
>>> On Wed,=C2=A0 3 Jan 2024 14:35:02 +0800, Heng Qi=20
>>> <hengqi@linux.alibaba.com> wrote:
>>>> There is a historical error in virtio spec:
>>>> =C2=A0=C2=A0 "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device=
 *MUST*=20
>>>> set flags
>>>> =C2=A0=C2=A0=C2=A0 to zero and SHOULD supply a fully checksummed packe=
t to the=20
>>>> driver."
>>>>
>>>> Currently in Linux and virtio-related implementations, the device=20
>>>> validates
>>>> the packet checksum and sets DATA_VALID regardless of whether
>>>> VIRTIO_NET_F_GUEST_CSUM is negotiated.
>>>>
>>>> Please refer to the following summary and thread[1] for details and=20
>>>> reasons:
>>>>
>>>> Summary
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> 1. GUEST_CSUM at virtio spec 0.95 is intended to be compatible with=20
>>>> partially
>>>> checksummed packets (NEEDS_CSUM <-> CHECKSUM_PARTIAL). So GUEST_CSUM=
=20
>>>> is mapped
>>>> to NETIF_F_RXCSUM.
>>>> GUEST_CSUM only indicates whether the driver handles partially=20
>>>> checksummed packets.
>>>> When XDP is loaded, the GUEST_CSUM's offload will be disabled, which=
=20
>>>> means that
>>>> packets have NEEDS_CSUM set will be dropped, and packets have=20
>>>> DATA_VALID set will
>>>> still be received.
>>>>
>>>> 2. When DATA_VALID was added to Linux in 2011[2] and virtio1.0, it=20
>>>> was actually
>>>> expected that rx checksum offload (the driver can set=20
>>>> CHECKSUM_UNNECESSARY) had
>>>> nothing to do with whether GUEST_CSUM was negotiated. But due to an=20
>>>> error, below
>>>> desctiption was added incorrectly:
>>>> =C2=A0=C2=A0 "If VIRTIO_NET_F_GUEST_CSUM is not negotiated, the device=
 *MUST*=20
>>>> set flags
>>>> =C2=A0=C2=A0=C2=A0 to zero and SHOULD supply a fully checksummed packe=
t to the=20
>>>> driver."
>>>>
>>>> 3. We now hope to correct this error. Let the setting of DATA_VALID=20
>>>> not be
>>>> controlled by whether GUEST_CSUM is negotiated, but only controlled=20
>>>> by whether
>>>> rx checksum offload is enabled on the OS side. The state of this rx=20
>>>> checksum
>>>> offload is not aware of the device.
>>>>
>>>> 4. [Optional] NETIF_F_RXCSUM corresponding to rx checksum offload=20
>>>> should be
>>>> added to dev->hw_features. When the user turns off rx checksum=20
>>>> offload through
>>>> ethtool -K, neither NEEDS_CSUM nor DATA_VALID should be taken care=20
>>>> of, that is,
>>>> all packets will be marked as CHECKSUM_NONE.
>>>>
>>>> Related Link
>>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> [1]=20
>>>> https://lists.oasis-open.org/archives/virtio-comment/202312/msg00135.h=
tml
>>>> [2] 10a8d94a9574 ("virtio_net: introduce VIRTIO_NET_HDR_F_DATA_VALID")
>>>>
>>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/185
>>
>> Hi Cornelia,
>>
>> Can this proposal be opened for voting?
>>
>> Thank you very much!
>>
>>>>
>>>> Suggested-by: Jason Wang <jasowang@redhat.com>
>>>> Signed-off-by: Heng Qi <hengqi@linux.alibaba.com>
>>> Reviewed-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> Hi Cornelia.
>
> Did you miss this email? :)
>
> Both Jason and Xuan have replied to Reviewed-by tag.
> Can we initiate a vote?

We currently can't do any voting (OASIS infrastructure update), and we
probably have to sort out the fallout from the new platform once it's
up.


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


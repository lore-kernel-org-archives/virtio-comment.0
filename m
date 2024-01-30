Return-Path: <virtio-comment-return-9035-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F710C47DA9
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 08:25:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 7C8412A83A
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 08:25:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44231986898
	for <virtio-comment@archiver.kernel.org>; Tue, 30 Jan 2024 08:25:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0E318986876; Tue, 30 Jan 2024 08:25:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F2752986879
	for <virtio-comment@lists.oasis-open.org>; Tue, 30 Jan 2024 08:25:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GmLAcCqcO2qY8jmGv0YFrA-1
From: Cornelia Huck <cohuck@redhat.com>
To: Shujun Xue <shujunxue@google.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Slava Malyugin
 <slavamn@google.com>, virtio-comment@lists.oasis-open.org,
 virtio-dev@lists.oasis-open.org
In-Reply-To: <CAB6OiKhLR809jmQXdP8oaXG=pf4N-saMeo5s_pig5aJ_hC+QDw@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <CAB6OiKgcWwH_qprNv6Z=F4=Hc2PckoCqQEJCGgkgNVL9Xx4k5A@mail.gmail.com>
 <87cytkkx48.fsf@redhat.com>
 <CAB6OiKhLR809jmQXdP8oaXG=pf4N-saMeo5s_pig5aJ_hC+QDw@mail.gmail.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Tue, 30 Jan 2024 09:25:45 +0100
Message-ID: <87y1c7jkhi.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] [PATCH] Define the DEVICE ID of Virtio Cpu balloon
 device as 47.

On Mon, Jan 29 2024, Shujun Xue <shujunxue@google.com> wrote:

> Is there ETA for the migration?

Well, I wish I knew...

>
> Bests,
> Shujun
>
>
> Cornelia Huck <cohuck@redhat.com>=E4=BA=8E2024=E5=B9=B41=E6=9C=8829=E6=97=
=A5 =E5=91=A8=E4=B8=80=E4=B8=8A=E5=8D=886:55=E5=86=99=E9=81=93=EF=BC=9A
>
>> On Tue, Jan 23 2024, Shujun Xue <shujunxue@google.com> wrote:
>>
>> > The Virtio CPU balloon device is a primitive device for managing guest
>> > CPU capacity: the device asks for certain CPU cores to be online,
>> > offline or throttled, and the driver performs the requested operation.
>> > This allows the guest to adapt to changes in allowance of underlying
>> > CPU capacity.
>>
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/187
>>
>> >
>> > Signed-off-by: Shujun Xue <shujunxue@google.com>
>> > ---
>> >  content.tex | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/content.tex b/content.tex
>> > index 0a62dce..87f0238 100644
>> > --- a/content.tex
>> > +++ b/content.tex
>> > @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>> >  \hline
>> >  45         &   SPI master \\
>> >  \hline
>> > +47         &   CPU balloon device \\
>> > +\hline
>> >  \end{tabular}
>> >
>> >  Some of the devices above are unspecified by this document,
>>
>> I'm holding off voting for now until the status of the OASIS
>> infrastructure migration is clear (sigh).
>>
>>


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


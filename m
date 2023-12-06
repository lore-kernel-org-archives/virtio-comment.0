Return-Path: <virtio-comment-return-8755-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC17EC4167B
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 14:35:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6BC4842D81
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 14:35:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C6EE5986A27
	for <virtio-comment@archiver.kernel.org>; Wed,  6 Dec 2023 14:35:36 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E14CD9866E7; Wed,  6 Dec 2023 14:35:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 609B69867D5
	for <virtio-comment@lists.oasis-open.org>; Wed,  6 Dec 2023 14:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Qm3pD90iMGmIXjL0lcsXDQ-1
From: Cornelia Huck <cohuck@redhat.com>
To: Haixu Cui <quic_haixcui@quicinc.com>, virtio-dev@lists.oasis-open.org,
 virtio-comment@lists.oasis-open.org, harald.mommer@opensynergy.com,
 broonie@kernel.org, qiang4.zhang@linux.intel.com, viresh.kumar@linaro.org
Cc: quic_ztu@quicinc.com
In-Reply-To: <9bf22a9a-1885-411e-951e-a22bf828da88@quicinc.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20231130092242.17303-1-quic_haixcui@quicinc.com>
 <20231130092242.17303-3-quic_haixcui@quicinc.com>
 <87r0k7lbd2.fsf@redhat.com>
 <b459c448-5e45-4cdd-bb06-06db040348bd@quicinc.com>
 <87leaekwyn.fsf@redhat.com>
 <9bf22a9a-1885-411e-951e-a22bf828da88@quicinc.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 06 Dec 2023 15:33:51 +0100
Message-ID: <8734wfienk.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [virtio-dev] [PATCH V6 2/2] virtio-spi: add the device
 specification

On Mon, Dec 04 2023, Haixu Cui <quic_haixcui@quicinc.com> wrote:

> Hi Huck,
>
> On 12/1/2023 7:01 PM, Cornelia Huck wrote:
>> On Fri, Dec 01 2023, Haixu Cui <quic_haixcui@quicinc.com> wrote:
>>=20
>>>>> +Note: chipselect is an electrical signal controlled by the SPI contr=
oller, used to select the
>>>>> +SPI slaves connected to the controller.
>>>>
>>>> I wonder whether another term is now more commonly used... the Wikiped=
ia
>>>> article uses main/sub, is there a term that is usually used together
>>>> with "controller"?
>>>
>>> In Wikipedia,
>>>
>>> "Historically, this arrangement has been called master/slave. But to
>>> avoid referencing slavery, alternative names discussed in =C2=A7 Altern=
ative
>>> namings have been used."
>>>
>>> I am not quite sure if main/sub is widely used, but in latest Linux,
>>> still use master/slave but master is gradually replaced by "controller"=
.
>>>
>>> So I think "controller" here does make sense. What is your suggestion?
>>=20
>> "controller" is fine, I'm just wondering if "slave" has started to be
>> replaced with something else as well... if it hasn't, we probably need
>> to stick with it to avoid confusing readers.
>>=20
>
> slave is still being used, but it's better to be used along with "master"=
.
>
> Here I prefer using "SPI peripherals" instead of "SPI slaves". Looking=20
> forward to your advice. Thank you so much.

"SPI peripherals" sounds good to me.


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


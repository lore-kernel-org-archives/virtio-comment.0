Return-Path: <virtio-comment-return-6532-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA06EB64D7
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 20:07:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 19EDC23D5A
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 20:07:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E23E1986408
	for <virtio-comment@archiver.kernel.org>; Mon, 26 Jun 2023 20:07:50 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C90449861EE; Mon, 26 Jun 2023 20:07:50 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A34A598621E
	for <virtio-comment@lists.oasis-open.org>; Mon, 26 Jun 2023 20:07:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687810062; x=1690402062;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4SIn3u+ovvcsRfWf6AhPk3kF6oddlElbblCm2thqbZE=;
        b=k39GyNCnWSR59V9Ml7AREJZpiVFzVdIfN5CNOhpeKzZf6t7AKC7AWhnIYiWPXAQ9jr
         CZvi4Nr/E8SMfKtXpcpTKLS247xN2zhavAmL0VAYlpagI90O5sJASaJujdeDrgkUeqir
         +BODiF24VBk3cgqbypBbX1eeODgfc+tkpEhdpnVO1Vvf54vpt4JEqUBXNPc8pO+Lodrm
         qtcIoO2QQV1uKPOtLy/EejNvY1s8nh8ubQVgzbUnCU4G/497k1BEEY7bpCyMT+O/9ien
         7VgsWunvV70RPG2fEvMpTS/s/nyjOUKgUm2AivELWcybZaQPBTfRUyDhBRPkfBUSLnDe
         LDzw==
X-Gm-Message-State: AC+VfDzEYFIvZeneN8aVjkNxdnkfTXEjLVtNTb2MRGgO9HXKbKUTa1Qj
	l1xaARAuaeljZODayhA/HzTtTg==
X-Google-Smtp-Source: ACHHUZ5FHpm6wLvA7WPiTkCX1VHsDpe3d9apMSfoCMJD6pNdOP2Wr591l6PfU8MDefzjZLQ2sy2sFg==
X-Received: by 2002:a7b:c017:0:b0:3f6:2ae:230e with SMTP id c23-20020a7bc017000000b003f602ae230emr27048893wmb.3.1687810061721;
        Mon, 26 Jun 2023 13:07:41 -0700 (PDT)
References: <20230619120128.234244-1-alex.bennee@linaro.org>
 <8d5fc5be-1db8-65c1-c8ab-9fbd10808a59@opensynergy.com>
User-agent: mu4e 1.11.7; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Harald Mommer <harald.mommer@opensynergy.com>
Cc: virtio-comment@lists.oasis-open.org, Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Harald Mommer <hmo@opensynergy.com>,
 Will Deacon <will@kernel.org>
Date: Mon, 26 Jun 2023 21:03:58 +0100
In-reply-to: <8d5fc5be-1db8-65c1-c8ab-9fbd10808a59@opensynergy.com>
Message-ID: <874jmu2dir.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rpmb: fix spec land mine in
 max_[wr|rd]_cnt


Harald Mommer <harald.mommer@opensynergy.com> writes:

> Hello,
>
> this damned "unlimited" makes me crazy. Nothing in a computer is unlimite=
d.
>
> How easy could life have been if the virtio spec had used 16 bit
> values for max_wr_cnt and max_rd_cnt in the config space but it is as
> it is and this cannot be changed any more.
>
> On 19.06.23 14:01, Alex Benn=C3=A9e wrote:
>> Even if 0 meant no limit we are still limited by the field size of the
>> request. That said for a maximum sized partition (* 80 128 1024) you
>> could only actually request 40960 blocks before running out of device.
>> Perhaps it would be better to mark 0 as invalid?
>
> Where comes this 80 from? I saw a 0x80 in the virtio specification,
> which would be 128 and not 80 decimal.

Ahh yes of course so a potential maximum of 16777216, but as you say...

>> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Cc: Harald Mommer <hmo@opensynergy.com>
>> Cc: Will Deacon <will@kernel.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>   device-types/rpmb/description.tex | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/device-types/rpmb/description.tex b/device-types/rpmb/descr=
iption.tex
>> index 1dae3fd..2ce8a5b 100644
>> --- a/device-types/rpmb/description.tex
>> +++ b/device-types/rpmb/description.tex
>> @@ -37,7 +37,7 @@ \subsection{Device configuration layout}\label{sec:Dev=
ice Types / RPMB Device /
>>      The values MUST range between 0x00 and 0x80 inclusive.
>>   \item[\field{max_wr_cnt and max_rd_cnt}] are the maximum numbers of RP=
MB
>>      block count (256B) that can be performed to device in one request. =
0 implies
>> -   no limitation.
>> +   no limitation other than the maximum value you can store in \field{b=
lock_count} (65535).
>>   \end{description}
>
> Yes, 65535 is what fits in the 2 byte block count of various
> underlying storage technology specs. So 65535 is an upper limit.
> Smallest upper limit which makes sense? I guess no as there is
> underlying storage technology.
>
> JESD85-B51 for eMMC:
>
> Looking at 6.6.22.4.3 Authenticated Data Write I see that at least for
> write 2 or 3 sizes may be supported:
>
> 1 block, 2 blocks and optionally 32 blocks but nothing in between of 2
> and 32.
>
> This is strange. If I understand this correctly (Maybe but I'm not
> sure) the limits of the underlying storage technology cannot be always
> represented cleanly by the virtio config space definitions due to the
> missing 3..31 value range.

I guess this depends on the backing store. Currently all the backends
I'm aware of emulate the RPMB storage but surely sometimes the
virtio-rpmb interface will be backed by a "real" RPMB partition.


> JESD220C-2.2 for UFS is more friendly:
>
> 14.1.4.4 Geometry descriptor
>
> bRPMB_ReadWriteSize is an 8 bit value, 0 seems not to be foreseen. 255
> is the theoretical maximum and we don't have to cope with 0 means
> "unlimited".
>
> And then I found something in an NVMe spec (NVM Express=C2=AE Base
> Specification, revision 2.0b)
>
> Figure 275 says that in bytes 315:312 some bits 31:24 (8 bits)
>
> "Access Size: If the Number of RPMB Units field is non-zero, then this
> field indicates the maximum number of 512B units of data that may be
> read or written per RPMB access by Security Send or Security Receive
> commands for the controller. This is a 0=E2=80=99s based value. A value o=
f 0h
> indicates support for one unit of 512B of data."
>
> So if I understand this correctly NVMe has the biggest limit with 255 + 1.
>
> Considering current storage technology it could be that in practice
> for now the best implementation choice when interpreting "unlimited"
> may be to interpret this as "256".
>
> Replacing the word "unlimited" by "65535" may not be what should be
> done here.

Seems reasonable.

>
>>     \devicenormative{\subsection}{Device Initialization}{Device
>> Types / RPMB Device / Device Initialization}


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

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


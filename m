Return-Path: <virtio-comment-return-6462-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AEBEB64D8
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 13:25:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 3CA6D370E5
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 13:25:33 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2BF809865D5
	for <virtio-comment@archiver.kernel.org>; Thu, 22 Jun 2023 13:25:33 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1E77598626D; Thu, 22 Jun 2023 13:25:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0A8459865D0
	for <virtio-comment@lists.oasis-open.org>; Thu, 22 Jun 2023 13:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687440331; x=1690032331;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7K7RaR8ADY4XeW4q151pcMyJ8ClxlbYyCVJq3aaKkHM=;
        b=BxMDztVS1h04q1JoSf8jJlDdhsfsbwvOaiu+PT1Fco3VQCeaUpUZLUdhlf7rA60wLQ
         qbhQzws5n3ZZKoXNfoEd5pM1YQD3IEBUjanbFDSvo7TRL30rBHMV4wD6lw0D3TeMtGw7
         7Yg+2k/2chHkZ3TLyg1GOApTHiOtzN8UQTHbKQW7QrcFeppjv018Ba6LWNSnXy0xbzO5
         aFh+68CtqJFP0eZo8T9oZY3N8n6mynDnjBYHzy3jycLXpL7Rde/BsMgsdY2c8aDR5Qw/
         eIgGZ6WRT2Cxitw8r0xm9m1NOhcPNaCRADLwvg94hPsSry7WKi3x4q2UvT+dDF/WQPMW
         yVxQ==
X-Gm-Message-State: AC+VfDzeraqWezOMWiNcF3Vwo5kby57W+2ivzqzUG5028P/mgt/y9jby
	RoZF6OfxHX5bj8eZjETybptO9g==
X-Google-Smtp-Source: ACHHUZ6UljJeMmOcX4KQ1tIhm7Q3JyF+wh0iFGMbgJR91luSc7VbCrfhUHlJRKAA/i+Y1Bs6qrR9Mw==
X-Received: by 2002:a05:6512:1c6:b0:4f9:567b:c35b with SMTP id f6-20020a05651201c600b004f9567bc35bmr4419929lfp.68.1687440330917;
        Thu, 22 Jun 2023 06:25:30 -0700 (PDT)
References: <20230619120128.234244-1-alex.bennee@linaro.org>
 <87v8fh17sj.fsf@redhat.com>
User-agent: mu4e 1.11.6; emacs 29.0.92
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cornelia Huck <cohuck@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, Manos  Pitsidianakis
 <manos.pitsidianakis@linaro.org>, Harald Mommer <hmo@opensynergy.com>,
 Will Deacon <will@kernel.org>
Date: Thu, 22 Jun 2023 14:16:24 +0100
In-reply-to: <87v8fh17sj.fsf@redhat.com>
Message-ID: <87zg4rfx2u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] [RFC PATCH] virtio-rpmb: fix spec land mine in
 max_[wr|rd]_cnt


Cornelia Huck <cohuck@redhat.com> writes:

> On Mon, Jun 19 2023, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>> Even if 0 meant no limit we are still limited by the field size of the
>> request. That said for a maximum sized partition (* 80 128 1024) you
>> could only actually request 40960 blocks before running out of device.
>> Perhaps it would be better to mark 0 as invalid?
>
> I don't think we can mark 0 as invalid, as it has been in a published
> spec and implementations may be already using it.

Certainly no open source implementations as this was pointed out in a
code review for a kernel driver implementation. But yes there may be
other virtio-rpmb in the field we don't know about.

Current feedback though is there are some difficulties integrating
virtio-rpmb into driver stacks which are designed around accessing RPMB
partitions on exiting storage devices.

I'm not sure how much virtio-rpmb should be adapted to more easily fit
into driver stacks though - there was lukewarm interest in integrating a
common RPMB kernel char based user-space API which doesn't need to
involve the block devices. However more likely consumers of virtio-rpmb
are going to be secure firmwares and early boot code.

> That said, what is the actual limitation? Knowing nothing about RPMB, is
> it 64k (what can fit in block_count), or the 40960 you mentioned above
> as a value defined by other reasons (maximum size of a partition -- I
> assume that cannot change?)

Yes, just above we state:

  \item[\field{capacity}] is the capacity of the device (expressed in 128KB=
 units).
     The values MUST range between 0x00 and 0x80 inclusive.

that said the capacity field has space for a bit more although it itself
is only 8 bit as well.

>
>>
>> Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>> Cc: Harald Mommer <hmo@opensynergy.com>
>> Cc: Will Deacon <will@kernel.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  device-types/rpmb/description.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/device-types/rpmb/description.tex b/device-types/rpmb/descr=
iption.tex
>> index 1dae3fd..2ce8a5b 100644
>> --- a/device-types/rpmb/description.tex
>> +++ b/device-types/rpmb/description.tex
>> @@ -37,7 +37,7 @@ \subsection{Device configuration layout}\label{sec:Dev=
ice Types / RPMB Device /
>>     The values MUST range between 0x00 and 0x80 inclusive.
>>  \item[\field{max_wr_cnt and max_rd_cnt}] are the maximum numbers of RPMB
>>     block count (256B) that can be performed to device in one request. 0=
 implies
>> -   no limitation.
>> +   no limitation other than the maximum value you can store in \field{b=
lock_count} (65535).
>
> So, I'm now wondering what these fields actually refer to. They are u8,
> so obviously less than what fits into be16... are reads/writes limited
> by anything else?
>
>>  \end{description}
>>=20=20
>>  \devicenormative{\subsection}{Device Initialization}{Device Types / RPM=
B Device / Device Initialization}


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


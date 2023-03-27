Return-Path: <virtio-comment-return-5039-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4575EC7619A
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 13:59:03 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8A35482C79
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 13:59:02 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 805D39863D6
	for <virtio-comment@archiver.kernel.org>; Mon, 27 Mar 2023 13:59:02 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 77A0E983BC4; Mon, 27 Mar 2023 13:59:02 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 68F8E9862E3
	for <virtio-comment@lists.oasis-open.org>; Mon, 27 Mar 2023 13:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Kw5806pOPgagnQMopZ7h8w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679925535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPfhbi4ppX7g1qo8+ecVLetzD3bvlLf5CF/fjOmYMPg=;
        b=m9iCAHFixRQEytM3ZqXg+0HIarrFC20PfFTzaWJWc+rHuN/16kZWRUxqyXuHi82qd6
         CLatoET0Ry6S7Pj3tqhuyJWTflRUmcFTjhmFcUmUdc6cLk0fIgicMUgbYd8iGgErU3Oz
         v4QcHzEuvPJk0YGCs5R8wLlWPMs8rMnIVbbMx4qUSs2Q/uPZJpXcmMSsxpRGufQwuVC5
         EdB4XNyQzLi47dnSeEOhhSfztAyUIQnganbEc0sdba8m6puR2wJAsn7TZlKo/KmziKm6
         WzMZq7swsYA90HTJgYuAv/bT2ys+VPc70zpgPDy2iHqOvLIxJtp7dK1c+4jL/9Nb6ad2
         dMLg==
X-Gm-Message-State: AAQBX9d8DzgMOZUGQOFESxgaUXL53Zb1b1axeiiQMPdDJ8VU9LauEFPK
	tz0xrE9e64aU/H5O56rl9uUzTkeFjfQdHBy3xPPsfBX7Hk1ocwuja/E1tNgCwxwY/XN7LAj7tSt
	Jnl7gHvmRjW2Fm3Ew1vfdSJPoE+9lWe8y5g==
X-Received: by 2002:a05:6214:2628:b0:5b9:ff75:a011 with SMTP id gv8-20020a056214262800b005b9ff75a011mr21329285qvb.48.1679925535005;
        Mon, 27 Mar 2023 06:58:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350aWa08N2OzIRvtDmgtggOsKTeO7gI2bfjx+G3vI8zu2plP//u37pdUjY+5J9GyQTi9dIpBF5g==
X-Received: by 2002:a05:6214:2628:b0:5b9:ff75:a011 with SMTP id gv8-20020a056214262800b005b9ff75a011mr21329248qvb.48.1679925534686;
        Mon, 27 Mar 2023 06:58:54 -0700 (PDT)
Date: Mon, 27 Mar 2023 15:58:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "mst@redhat.com" <mst@redhat.com>, 
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>, "pasic@linux.ibm.com" <pasic@linux.ibm.com>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, Shahaf Shuler <shahafs@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Message-ID: <tzpnzzvujby6vep2ja34x5vz2dvi2nyzr4i6ssj4z2t46zqnzj@llrivtyqnnn3>
References: <20230324010432.280330-1-parav@nvidia.com>
 <20230324010432.280330-5-parav@nvidia.com>
 <sfu7ficnxkfnjrpbl4mnc3lwanrcocxxnoegk7smwy5a4g3jtf@hgh3e3ex4hxv>
 <PH0PR12MB5481E49E7F5C8E4634EB2D00DC8B9@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E49E7F5C8E4634EB2D00DC8B9@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v6 4/8] transport-mmio: Refer to the vq
 by its number

On Mon, Mar 27, 2023 at 01:41:33PM +0000, Parav Pandit wrote:
>Hi Stefano,
>
>> From: Stefano Garzarella <sgarzare@redhat.com>
>> Sent: Monday, March 27, 2023 6:04 AM
>
>> Maybe we can also remove `index` from the last sentence in this section.
>> I mean something like this:
>>
>> --- a/transport-mmio.tex
>> +++ b/transport-mmio.tex
>> @@ -113,8 +113,8 @@ \subsection{MMIO Device Register
>> Layout}\label{sec:Virtio Transport Options / Vi
>>       following operations on \field{QueueSizeMax},
>>       \field{QueueSize}, \field{QueueReady},
>>       \field{QueueDescLow}, \field{QueueDescHigh}, \field{QueueDriverlLow},
>> \field{QueueDriverHigh},
>> -    \field{QueueDeviceLow}, \field{QueueDeviceHigh} and \field{QueueReset}
>> apply to. The index
>> -    number of the first queue is zero (0x0).
>> +    \field{QueueDeviceLow}, \field{QueueDeviceHigh} and \field{QueueReset}
>> apply to.
>> +    The number of the first queue is zero (0x0).
>>     }
>>     \hline
>>     \mmioreg{QueueSizeMax}{Maximum virtual queue size}{0x034}{R}{%
>>
>> Thanks,
>> Stefano
>>
>With Michael suggestion, the first patch describes the vq number range.

I see.

>I think we can drop this duplicate text from here all together.
>

Yep, I agree on that.

Thanks,
Stefano


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/


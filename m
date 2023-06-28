Return-Path: <virtio-comment-return-6565-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AD8EB64D7
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 06:55:40 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id E05A288E07
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 06:55:39 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BF76B986573
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 06:55:39 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AA3CA98654E; Wed, 28 Jun 2023 06:55:39 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96D9E98654F
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 06:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687935337; x=1690527337;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O3O0ffgwYIxYpd4mfluJOYFT3vTCqtwqO197QXs8uKs=;
        b=dJhzVvI7HRIYRIYbAWdQj+4vnlC3NmLIwAsdlndLXe+vl1Ag1+ybJKtYZXavVabNsj
         BDVvyWfl4BCJ5n+HDVJVFIl6xKDiTVVqugihzNs7620f687WdHteWJRdXmApba9rny0N
         g+4UKQY2GpcV+tDyBw5wQ6ULCRrWzueIMbMRv6oaMlXidbODhA7B7groJckaen9k65IJ
         huT4ijCRofIWkso7jwRN+XDnfYPdSNG+MSvN63cr9qwUrtVjYkQhP0glZTEg79LlmaOd
         x3zYcUJ4S7quL8aUaNM+FQuQWllg6E+dcdPknkhrWUv+WroX0A/UQ786VjCXhDYuauGD
         SMOw==
X-Gm-Message-State: AC+VfDxZgevPm3OPQcJq3CPvi8fjqomOEuD1X3waGHlMon7bjyOSsfOh
	7EvDQuUa9/Q9vEebjvu4eFwxcQ==
X-Google-Smtp-Source: ACHHUZ5wLGzFve/47ZM45LtF4Wgrb0xTnXq1KZgkp9jSVz5rZjL9f4MBITi/0CZjYalLmlGF6iCgZw==
X-Received: by 2002:a9d:6f16:0:b0:6b7:3549:980a with SMTP id n22-20020a9d6f16000000b006b73549980amr11331143otq.31.1687935337479;
        Tue, 27 Jun 2023 23:55:37 -0700 (PDT)
Message-ID: <acb2a80a-77c1-6a89-a258-15df427541fd@bytedance.com>
Date: Wed, 28 Jun 2023 14:53:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
Cc: stefanha@redhat.com, parav@nvidia.com, mst@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, zhouhuaping.san@bytedance.com,
 xinhao.kong@duke.edu, Zhu Lingshan <lingshan.zhu@intel.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-5-pizhenwei@bytedance.com>
 <CACGkMEuNbKa8CJAKeB+ATeC9h=6aJ04U1Ti2k6SMde8Giiq8+w@mail.gmail.com>
 <ebf95d17-36e2-9e46-cb03-459c12f75a87@bytedance.com>
 <CACGkMEthPiw5XK7ADWNefRPBzhqFBNxnOvZjCNJsooj99C4-DA@mail.gmail.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CACGkMEthPiw5XK7ADWNefRPBzhqFBNxnOvZjCNJsooj99C4-DA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: Re: Re: [PATCH v4 4/7] transport-fabrics: introduce command set



On 6/28/23 10:56, Jason Wang wrote:
> On Wed, Jun 28, 2023 at 9:37 AM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>>
>>
>> On 6/27/23 17:04, Jason Wang wrote:
>>> On Mon, Jun 26, 2023 at 3:28 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>>>
>>>> Introduce command set for Virtio-oF which includes:
>>>> - command id: a tag to distinguish in-flight commands
>>>> - status: indicate the result of a Virtio-oF command
>>>> - opcodes: the Virtio-oF transport layer commands use 0x0000-0x0fff,
[snip]
>>>> +\begin{lstlisting}
>>>> +#define virtio_of_op_connect               0x0000
>>>> +#define virtio_of_op_disconnect            0x0001
>>>> +#define virtio_of_op_keepalive             0x0002
>>>> +#define virtio_of_op_get_feature           0x0004
>>>> +#define virtio_of_op_set_feature           0x0005
>>>> +#define virtio_of_op_get_keyed_num_descs   0x0100
>>>> +#define virtio_of_op_vq                    0x0fff
>>>> +#define virtio_of_op_get_vendor_id         0x1000
>>>> +#define virtio_of_op_get_device_id         0x1001
>>>> +#define virtio_of_op_reset_device          0x1003
>>>> +#define virtio_of_op_get_status            0x1004
>>>> +#define virtio_of_op_set_status            0x1005
>>>> +#define virtio_of_op_get_device_feature    0x1006
>>>> +#define virtio_of_op_set_driver_feature    0x1009
>>>> +#define virtio_of_op_get_vq_size           0x100a
>>>> +#define virtio_of_op_get_config            0x100c
>>>> +#define virtio_of_op_set_config            0x100d
>>>
>>> We had a proposal of transport virtqueue that allows using a
>>> virtqueue[1] for configuring a device. And Ling shan will rebase it on
>>> top of the admin commands.
>>>
>>> That is to say, admin commands could be used for transport which will
>>> be duplicated with the commands you invented here.
>>>
>>> I wonder if the virtio-OF can just reuse the admin commands (have a
>>> quick glance and I didn't find any blocker for this).
>>>
>>> Thanks
>>>
>>> [1] https://lists.oasis-open.org/archives/virtio-comment/202208/msg00003.html
>>>
>>
>>   From my understand, the virtio device related commands looks
>> similar(set/get status/features, reset device ...), but not same:
>> 1, the admin commands are executed upon the admin virtqueue, it uses
>> virtqueue based transfer.
> 
> Note that the actual commands are independent of admin virtqueue. It
> is defined separately as admin commands and it would be supported by
> the MMIO in the future.
> 
>> The virtio-of commands are executed upon a virtio-of queue(established
>> reliable connection), not a virtqueue. A virtio-of device could support
>> admin commands in theory.
>> I suppose a virtio-of device with admin vq supported like:
>> +---------------------+
>> |   +-------------+   |
>> |   |control queue|   |
>> |   +-------------+   |
>> +---------------------+
>> |   +-------------+   |
>> |   | virtqueue0  |   |
>> |   +-------------+   |
>> |   | virtqueue1  |   |
>> |   +-------------+   |
>> |   | virtqueue ..|   |
>> |   +-------------+   |
>> |   |  admin vq   |   |
>> |   +-------------+   |
>> +---------------------+
>>
>> The virtio-of commands ares used by both virtio-of control queue and
>> virtio-of virtqueues(include admin vq).
>> The admin commands are used by admin vq only.
>>
>> 2, the virtio-of commands are used over fabrics, they are defined in a
>> fixed size,
> 
> Any issue you see if it is variable?
> 

For stream transfer, a command of variable length is difficult to decode.
For keyed transfer, the receiver side must know the size of commands, 
then post recv large enough memory. And unaligned length hurts the 
performance.

>> the admin commands are described by virtqueue descriptors.
> 
> See above, it's not necessarily carried via descriptors.
> 
>>
>> 3, the virtio-of commands need a command_id field to distinguish each
>> other for command depth, but the admin commands don't need command_id
>> field(supported by virtqueue descriptor heads).
> 
> I'm not sure I get this, could you give me an example?
> 

Please see subsubsection{Command ID} in this patch.

>>
>> 4, connect/disconnect are fabrics specific, stream/keyed transfer
>> related features/commands are fabrics specific too.
>> interrupt related commands are not used by virtio-of.
> 
> So we had:
> 
> struct virtio_admin_cmd {
>          /* Device-readable part */
>          le16 opcode;
>          /*
>           * 1       - SR-IOV
>           * 2-65535 - reserved
>           */
>          le16 group_type;
> ...
> };
> 
> The of specific command could have a dedicated group in this case.
> 
> Thanks
> 

The command set to virtio-of looks like:
[Common configuration structure layout] to Virtio PCI,
[MMIO Device Register Layout] to Virtio MMIO,
[Channel Commands for Virtio] to Virtio Channel I/O.

By the way, [Channel Commands for Virtio] is already defined, is it 
possible to reuse it?

>>
>> As far as I can see, they are quite different, defining them separately
>> would be fine.
>>
>> --
>> zhenwei pi
>>
> 

-- 
zhenwei pi

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


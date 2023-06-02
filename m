Return-Path: <virtio-comment-return-6086-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F69AC77B7A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 02:31:13 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 767602AF7B
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 02:31:12 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 65E5B9867DF
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 02:31:12 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 580499867DA; Fri,  2 Jun 2023 02:31:12 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 43EE39867DB
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 02:31:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685673070; x=1688265070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yjv6Y87nTCQ8X1XT4xFIrxeazCxurlunIElX3ZfuFEI=;
        b=Ntzs0rjqiV8VQ0P95DQbCRvkz18MYOn9YSDLULZM7kPIwJNdOp0QmpcOULEv6DZk50
         D5HjsTrQMU44mHkMjSa3p+h2mIEDio/NbEgVnXEcLFB7hgyTmdoDmJN8Y7svh5LJID7V
         KSpnpzdjgZm2HLTs+C3cMIhtQAh/AOVDWJKRfEV8BaA5P+dPnyqHODxxNoE//KRGQLUa
         1tMKd03NHDd1OWv4dzGN7J3KECCPm8AyhsRd1FcCFQ862WwStTXk1Aia+IzKX4nrSXed
         cLaZG/BluT+euxkbdcUGO4DIBujS1yO5dIXKxkdSppAFVVCkH2voj0TS6QvVzpI7vFeq
         mfHg==
X-Gm-Message-State: AC+VfDzoRIb3wxuli88wUyLShzIqylPTqUoFzfMEhVgXU87A2tq4cMC5
	YBJW652iVMaTa0iQzobwwbRCYQ==
X-Google-Smtp-Source: ACHHUZ4vLRGCt/kwe87RRPwLrwOju+rb0Nyh6Eb1WlvrlDNEGX/bLT7K5+IfajAICfKDA68PnwgQcQ==
X-Received: by 2002:a17:902:e741:b0:1b0:10a1:3da9 with SMTP id p1-20020a170902e74100b001b010a13da9mr954997plf.32.1685673069736;
        Thu, 01 Jun 2023 19:31:09 -0700 (PDT)
Message-ID: <c4621ae5-a677-8ecf-1b80-f598069cc0d4@bytedance.com>
Date: Fri, 2 Jun 2023 10:26:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-5-pizhenwei@bytedance.com>
 <20230531152059.GF1248296@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531152059.GF1248296@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] [PATCH v2 04/11] transport-fabrics:
 introduce Stream Transmission



On 5/31/23 23:20, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:03PM +0800, zhenwei pi wrote:
>> Stream transmission is used for stream oriented communication(Ex TCP),
>> also add virtio-blk read/write 8K example.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 229 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 229 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index b88acfd..c02cf26 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -88,3 +88,232 @@ \subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport Options
>>   \end{tabular}
>>   
>>   Depending on the opcode, a Command contains zero or more structure virtio_of_vring_desc.
>> +
>> +\subsubsection{Buffer Mapping Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Buffer Mapping Definition}
>> +Virtio Over Fabrics defines two types of buffer mapping rules.
> 
> What is a buffer? Is it a virtqueue buffer (consisting of one or more
> descriptors/elements) or are you using the term for a different concept?
> 

I'll use 'descriptor' to describe this only in the next version.

>> +
>> +\paragraph{Stream Transmission}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Commands Definition / Stream Transmission}
>> +Command, Segment Descriptors, and buffer are transmitted in a stream within a
> 
> Is a Segment Descriptor a virtio_of_vring_desc?
> 
>> +connection. The layout in stream:
>> +
>> +\begin{lstlisting}
>> +CMDx contains 0 descriptor, CMDy contains (n - m + 1) descriptors and buffer:
> 
> "0 descriptors"
> 

OK.
>> +
>> +     +-----+     +-----++-----+     +-----++-----+
>> + ... | CMDx| ... | CMDy||DESCm| ... |DESCn|| BUF | ...
>> +     +-----+     +-----++-----+     +-----++-----+
>> +
>> +COMPx contains 0 descriptor, COMPy contains (k - j + 1) descriptors and buffer:
> 
> I think this is the first time the concept of a completion (COMP) was
> introduced. Please describe commands/completions before using them in
> the text.
> 

OK.
>> +
>> +     +-----+     +-----++-----+     +-----++-----+
>> + ... |COMPx| ... |COMPy||DESCj| ... |DESCk|| BUF | ...
>> +     +-----+     +-----++-----+     +-----++-----+
>> +\end{lstlisting}
>> +
>> +An example of a virtio-blk write 8K request(total size: sizeof(Command) +
>> +4 * sizeof(Descriptor) + 8208):
>> +\begin{lstlisting}
>> + COMMAND            +------+
>> +                    |opcode|  ->  virtio_of_op_vring
>> +                    +------+
>> +                    |cmd id|  ->  10
>> +                    +------+
>> +                    |length|  ->  8208
>> +                    +------+
>> +                    |ndesc |  ->  4
>> +                    +------+
>> +                    |rsvd  |
>> +                    +------+
>> +
>> + DESC0              +------+
>> +              +-----|addr  |  -> 0
>> +              |     +------+
>> +              |     |length|  -> 16 (virtio blk write command)
>> +              |     +------+
>> +              |     |id    |  -> 0
>> +              |     +------+
>> +              |     |flags |  -> 0
>> +              |     +------+
>> +              |
>> + DESC1        |     +------+
>> +              | +---|addr  |  -> 16
>> +              | |   +------+
>> +              | |   |length|  -> 4096
>> +              | |   +------+
>> +              | |   |id    |  -> 1
>> +              | |   +------+
>> +              | |   |flags |  -> 0
>> +              | |   +------+
>> +              | |
>> + DESC2        | |   +------+
>> +              | | +-|addr  |  -> 4112
>> +              | | | +------+
>> +              | | | |length|  -> 4096
>> +              | | | +------+
>> +              | | | |id    |  -> 2
>> +              | | | +------+
>> +              | | | |flags |  -> 0
>> +              | | | +------+
>> +              | | |
>> + DESC3        | | | +------+
>> +              | | | |addr  |  -> 0
> 
> Is this field 0 in all stream connection VIRTIO_OF_DESC_F_WRITE
> descriptors?
> 

Yes. I missed the comment of 'addr' field in the '[PATCH v2 03/11] 
transport-fabircs: introduce Segment Descriptor Definition.

When the flags has VIRTIO_OF_DESC_F_KEYED, the 'addr' means the remote 
address. otherwise the 'addr' means the offset in the stream buffer. 
Because VIRTIO_OF_DESC_F_WRITE is a read descriptor, there is no payload 
in the command, the 'addr' of a read descriptor always 0.

>> +              | | | +------+
>> +              | | | |length|  -> 1
>> +              | | | +------+
>> +              | | | |id    |  -> 3
>> +              | | | +------+
>> +              | | | |flags |  -> VIRTIO_OF_DESC_F_WRITE
>> +              | | | +------+
>> +              | | |
>> + DATA         +-+-+>+------+  -> 0
>> +                | | |......|
>> +                +-+>+------+  -> 16
>> +                  | |......|
>> +                  +>+------+  -> 4112
>> +                    |......|
>> +                    +------+  -> 8208
>> +\end{lstlisting}
>> +
>> +The Completion of this request(total size: sizeof(Completion) +
>> +1 * sizeof(Descriptor) + 1):
>> +\begin{lstlisting}
>> + COMPLETION         +------+
>> +                    |status|  ->  VIRTIO_OF_SUCCESS
>> +                    +------+
>> +                    |cmd id|  ->  10
>> +                    +------+
>> +                    |ndesc |  ->  1
>> +                    +------+
>> +                    |rsvd  |
>> +                    +------+
>> +                    |value |  -> 1 (value.u32)
> 
> What is this field and what does u32 mean?
> 

Same to the virtq_used_elem::len 
(https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-540008).
I need reorder the patch, move completion definition before using.

>> +                    +------+
>> +
>> + DESC0              +------+
>> +                  +-|addr  |  -> 0
>> +                  | +------+
>> +                  | |length|  -> 1
>> +                  | +------+
>> +                  | |id    |  -> 3
> 
> This has to match with the original descriptor id sent with the Command?
> 

Yes.

>> +                  | +------+
>> +                  | |flags |  -> VIRTIO_OF_DESC_F_WRITE
>> +                  | +------+
>> +                  |
>> + DATA             |>+------+  -> 0
>> +                    |......|
>> +                    +------+  -> 1
>> +\end{lstlisting}
> 
> I think this is more flexible (and has more protocol overhead) than
> necessary. When the device has used a virtqueue buffer, it indicates how
> many bytes were used (this can be less than the totaly number of F_WRITE
> bytes available). I don't think there is a need to communicate F_WRITE
> descriptors, especially in the Completion. Just a Completion with a
> 'length' field instead of an 'ndesc' field followed by data is enough.
> 

I guest this is not enough. For example, a initiator want to read 3 
desc: desc0[n bytes], desc1[m bytes], desc2[1 byte]. desc[2] is expected 
to read a u8 status.

the target fills desc0[n - x bytes], desc1[m - y bytes], desc2[1 byte], 
the 'length' is (n - x + m - y + 1), we should decode each descriptor 
and fill the driver buffer correctly.(otherwise, if x + y > 0, desc[2] 
is never filled)

> Since VIRTIO has flexible framing
> (https://docs.oasis-open.org/virtio/virtio/v1.2/csd01/virtio-v1.2-csd01.html#x1-390004),
> there isn't really a need to communicate the F_WRITE descriptors at all,
> just the maximum number of used bytes that the initiator expects.
> 
> Can you explain why you chose to transmit F_WRITE descriptors in both
> the Command and the Completion? Maybe I missed a reason why it's
> important.

Just keep the flags same to the descriptor from the command, give the 
initiator a hint 'this is a read descriptor'.

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


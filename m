Return-Path: <virtio-comment-return-6088-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4978EC77B7A
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:10:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 6C3552AF7B
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:10:46 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 57F999867DC
	for <virtio-comment@archiver.kernel.org>; Fri,  2 Jun 2023 03:10:46 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 441DA983E8D; Fri,  2 Jun 2023 03:10:46 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 306899867DB
	for <virtio-comment@lists.oasis-open.org>; Fri,  2 Jun 2023 03:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685675444; x=1688267444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNOj3l8JQb61XgfCpLzy7qL8uM9hugyittABru0ties=;
        b=i/7qZKyJ4kUNCYisJFhiwnQzg5a79kib8NgNkhnUd4cH3TrEm+O8E9IqMhpD9g57tT
         VXsean8nKRicjMNw5m5mmHhSH7/QBkgefK+W11OKAjfcT3H90zEJsrF1rO5t4ZUM/n2K
         M8Hs0f6sMsz0VoJUptje9JdkKKrVbp6Kjv2c2UY4lZX/FEVuAbaAGaC1ZYrIBLDmGwxT
         ayCmA5nrkjDgx9lLHkGm0HPzrB4CN+ahNIANAK1MTrYuffrPcP3N9Xjocz8le6VUYa7/
         f7tVvBAvwLdYRL+PouI8qpw4MtbBGz8iBsE/uMwmVPH/G4TZa04PwBG02hTLwu4YicHv
         bhPA==
X-Gm-Message-State: AC+VfDyX7f+3aklVoNKgcYz+Zu3K2frvJw+q+zrsZvm0//uYwF5vKLKa
	/6nDGXDoKekmcCVvyvCCll6GcQ==
X-Google-Smtp-Source: ACHHUZ4yvgJhXeUJPRUK4H5In8LlYgw1h3C6kPkc5b6af+qI8JJBsy+8SjM0hNtMS/87WXmdNnOdvg==
X-Received: by 2002:a17:90a:c7d2:b0:256:8065:6a4c with SMTP id gf18-20020a17090ac7d200b0025680656a4cmr1162415pjb.23.1685675444085;
        Thu, 01 Jun 2023 20:10:44 -0700 (PDT)
Message-ID: <e24be5eb-6aa9-01a2-3598-1ebf8db7e00c@bytedance.com>
Date: Fri, 2 Jun 2023 11:08:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: parav@nvidia.com, mst@redhat.com, jasowang@redhat.com,
 virtio-comment@lists.oasis-open.org, houp@yusur.tech,
 helei.sig11@bytedance.com, xinhao.kong@duke.edu
References: <20230504081910.238585-1-pizhenwei@bytedance.com>
 <20230504081910.238585-4-pizhenwei@bytedance.com>
 <20230531142329.GE1248296@fedora>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <20230531142329.GE1248296@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Re: [virtio-comment] [PATCH v2 03/11] transport-fabircs:
 introduce Segment Descriptor Definition



On 5/31/23 22:23, Stefan Hajnoczi wrote:
> On Thu, May 04, 2023 at 04:19:02PM +0800, zhenwei pi wrote:
>> Introduce segment descriptor to describe the Virtio device buffer
>> segments.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 43 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index 26b0192..b88acfd 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -45,3 +45,46 @@ \subsection{Virtio Qualified Name}\label{sec:Virtio Transport Options / Virtio O
>>   \item The string is null terminated.
>>   \item There is no strict style limitation.
>>   \end{itemize}
>> +
>> +\subsection{Transmission Protocol}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol}
>> +This section defines transmission protocol for Virtio Over Fabrics. All the
> 
> What does "transmission protocol" mean? I guess this is what is often
> called a network protocol or a wire protocol or just a protocol, but it
> wasn't clear to me maybe whether the "transmission protocol" is one
> protocol out of a set of protocols that make up Virtio Over Fabrics.
> 
> This paragraph should describe which connections use this protocol. For
> example:
> 
>    This protocol is used for both control and virtqueue connections.
> 
>> +fields use little endian format.
>> +
>> +\subsubsection{Segment Descriptor Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Transmission Protocol / Segment Descriptor Definition}
>> +Virtio Over Fabrics uses the following structure to describe data segment:
> 
> What is a data segment? I guess it's a message/command/request?
> 
> There should be an explanation of how data segments are used. For
> example:
> 
>    The initiator sends a data segment containing the command to the
>    target. The target sends a data segment containing the response to the
>    command back to the initiator.
> 
>> +
>> +\begin{lstlisting}
>> +struct virtio_of_vring_desc {
> 
> I think the name "vring" should be avoided. The vring is an in-memory
> layout for implementing virtqueues where shared memory is available.
> Calling it virtio_of_vq_desc makes it clear that Virtio Over Fabrics
> does not use vrings to implement virtqueues.
> 
>> +        le64 addr;
>> +        le32 length;
>> +        /* This marks the unique ID within a command, no limitation among inflight commands */
> 
> What is a command?
> 
>> +        le16 id;
>> +        /* This marks a buffer as keyed transmission (otherwise stream transmission) */
>> +#define VIRTIO_OF_DESC_F_KEYED     1
>> +        /* This marks a buffer as device write-only (otherwise device read-only). */
>> +#define VIRTIO_OF_DESC_F_WRITE     2
>> +        le16 flags;
>> +        le32 key;
>> +};
>> +\end{lstlisting}
>> +
>> +The structure virtio_of_vring_desc is used for both keyed transmission
>> +(i.e. RDMA) and stream transmission(i.e. TCP). The fields is described as follows:
>> +
>> +\begin{tabular}{ |l|l|l| }
>> +\hline
>> +Field & keyed transmission & stream transmission \\
>> +\hline \hline
>> +addr & Start address of remote memory buffer & Start address within the stream buffer \\
> 
> What is a stream buffer?
> 
>> +\hline
>> +length & The length of remote memory buffer & The length of buffer within the stream \\
> 
> I'm not sure what buffer means here. I guess it's not the same as a
> virtqueue buffer, it's probably a virtqueue descriptor (element)?
> 
> Can you avoid using buffer here since it usually means something else in
> Virtio?
> 

OK.

>> +\hline
>> +id & The ID of this descriptor & The ID of this descriptor \\
>> +\hline
>> +flags & both keyed transmission and stream transmission supported & stream transmission only \\
> 
> I'm not sure what this means.
> 
>> +\hline
>> +key & Key of the remote Memory Region & Ignore \\
> 
> Should "Ignore" be "Reserved" so that stream transmission can use this
> field for something else in the future?
> 

OK

>> +\hline
>> +\end{tabular}
>> +
>> +Depending on the opcode, a Command contains zero or more structure virtio_of_vring_desc.
> 
> opcode hasn't been defined yet. I guess that's because the first
> virtio_of_vring_desc contains a Command and that has an opcode field?
> Please make sure the text is ordered so that terms are defined before
> they are used.
> 
> Stefan

OK, I think reordering the text is needed in the next version.

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


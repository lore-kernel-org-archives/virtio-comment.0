Return-Path: <virtio-comment-return-6557-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9A2EB64D9
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 01:37:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id D0D8C42563
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 01:37:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C0C5798656F
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Jun 2023 01:37:21 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id AD2BA986317; Wed, 28 Jun 2023 01:37:21 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96E7498654C
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Jun 2023 01:37:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687916239; x=1690508239;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rqstDiBzelMAvRwUO6Z18fVnhFLSRAsZTWC1Pui1R8k=;
        b=WzYO5UkMclCetXutrRHuiKSzwvsOno//R0lCl8YknQWKCa47nBl2iY8s+4u/7zSAKN
         LQyWsSG/zvjoWpasCW8RKdYMsjNHhRyjNt9peLRrgGS1RZg/W20d/plZM5KDdRh21w7O
         9BHH1W0/UcwKKVGG1O1JnhkU5SR7g6542mlYfLylGIoRdLhi+Gtq8nG8xhcDF/rejIe4
         KkdKB3R6WorxcpgPbG5q891ZLZpyXx3wGqu4HdJdBVAm7qxMD3y+uon9EvTom+u4ycE2
         Q4zp/yyyprbea7ioV40/Xv5YVirLeTugnjCl2Rxmt4r4yBpoHO0W7Xjytv3wyyZIrXj4
         bZPA==
X-Gm-Message-State: AC+VfDzTeDhT9BpVPNOO/+gFlr67ySmYCAa2+rIf6/WGsDEyL7Ho648S
	QXKf5BmZ4wOUfWdEYQpzNY2Pww==
X-Google-Smtp-Source: ACHHUZ6R8ZqI6/7PHhtIrpZI2PuW9EKvhpSW4NXCqoriMObFa5tt9gIYp2HobC10xologYwXvO/EFg==
X-Received: by 2002:a17:902:e746:b0:1b6:6963:4cc0 with SMTP id p6-20020a170902e74600b001b669634cc0mr8939916plf.53.1687916239521;
        Tue, 27 Jun 2023 18:37:19 -0700 (PDT)
Message-ID: <ebf95d17-36e2-9e46-cb03-459c12f75a87@bytedance.com>
Date: Wed, 28 Jun 2023 09:34:57 +0800
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
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CACGkMEuNbKa8CJAKeB+ATeC9h=6aJ04U1Ti2k6SMde8Giiq8+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: Re: [PATCH v4 4/7] transport-fabrics: introduce command set



On 6/27/23 17:04, Jason Wang wrote:
> On Mon, Jun 26, 2023 at 3:28 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Introduce command set for Virtio-oF which includes:
>> - command id: a tag to distinguish in-flight commands
>> - status: indicate the result of a Virtio-oF command
>> - opcodes: the Virtio-oF transport layer commands use 0x0000-0x0fff,
>>            and the device layer commands use 0x1000-0xffff.
>>            get/set status/feature/ config use consecutive number.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>>   transport-fabrics.tex | 616 ++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 616 insertions(+)
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> index d562b2c..3fd9e8e 100644
>> --- a/transport-fabrics.tex
>> +++ b/transport-fabrics.tex
>> @@ -113,3 +113,619 @@ \subsubsection{Keyed Data Transfers}\label{sec:Virtio Transport Options / Virtio
>>        |COMP|     |COMP|     |COMP|
>>        +----+     +----+     +----+
>>   \end{lstlisting}
>> +
>> +
>> +\subsection{Commands Definition}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition}
>> +This section defines data structures, opcodes, and status for Virtio-oF.
>> +A Virtio-oF command is fixed to 16 bytes, and a Virtio-oF completion is fixed to 16 bytes.
>> +Note that the reserved fields of Virtio-oF commands and completions are filled with zero.
>> +
>> +\subsubsection{Command ID}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Command ID}
>> +The Command ID (le16 type) is used to uniquely describe a Virtio-oF PDU for identification.
>> +Generally, the Virtio-oF initiator allocates a Command ID that is unique for all in-flight commands,
>> +and the Virtio-oF target specifies the same Command ID for completion.
>> +
>> +Command IDs 0xff00 - 0xffff are reserved for the Virtio-oF control queue asynchronous events.
>> +The reserved Command IDs for the Virtio-oF control queue are as follows:
>> +
>> +\begin{tabular}{ |l|l| }
>> +\hline
>> +Command ID & Description \\
>> +\hline \hline
>> +0xfffe & Config change. Causes the initiator to generate a configuration change notification \\
>> +\hline
>> +0xffff & Keepalive. The initiator ignores this event \\
>> +\hline
>> +0xff00 - 0xfffd & Reserved \\
>> +\hline
>> +\end{tabular}
>> +
>> +\subsubsection{Status}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Status}
>> +The Status (le16 type) of a Virtio-oF completion is used to indicate the result of a Virtio-oF command in detail.
>> +The status values are defined as follows:
>> +
>> +\begin{lstlisting}
>> +/* command executed successfully */
>> +#define VIRTIO_OF_STATUS_SUCCESS       0x0000
>> +
>> +/* unrecognized command, or disabled command due to unsupported feature */
>> +#define VIRTIO_OF_STATUS_ENOCMD        0x0001
>> +/* in-flight commands exceeded queue size */
>> +#define VIRTIO_OF_STATUS_ECMDQUOT      0x0002
>> +
>> +/* no such target specified by TVQN */
>> +#define VIRTIO_OF_STATUS_ENOTGT        0x1001
>> +/* failed to create Virtio-oF device instance */
>> +#define VIRTIO_OF_STATUS_ENODEV        0x1002
>> +/* rejected due to access control */
>> +#define VIRTIO_OF_STATUS_EACLREJECTED  0x1003
>> +/* bad Virtio-oF device instance ID */
>> +#define VIRTIO_OF_STATUS_EBADDEV       0x1010
>> +/* mismatched TVQN or IVQN from Virtio-oF device instance */
>> +#define VIRTIO_OF_STATUS_EBADVQN       0x1011
>> +/* Virtio-oF virtqueue index exceeded */
>> +#define VIRTIO_OF_STATUS_EQUEUEQUOT    0x1020
>> +/* Virtio-oF virtqueue size exceeded */
>> +#define VIRTIO_OF_STATUS_EQSIZEQUOT    0x1021
>> +
>> +/* unsupported Virtio-oF feature */
>> +#define VIRTIO_OF_STATUS_EFEATURE      0x2000
>> +/* unsupported Virtio-oF device instance status */
>> +#define VIRTIO_OF_STATUS_ESTATUS       0x2010
>> +/* unsupported Virtio-oF device instance feature */
>> +#define VIRTIO_OF_STATUS_EDEVFEATURE   0x2020
>> +/* unsupported offset of device configuration space */
>> +#define VIRTIO_OF_STATUS_ECONFOFF      0x2030
>> +/* unsupported bytes of device configuration space */
>> +#define VIRTIO_OF_STATUS_ECONFBYTES    0x2031
>> +/* failed to read device-readable virtqueue buffers */
>> +#define VIRTIO_OF_STATUS_EOUTVQBUF     0x20f0
>> +/* failed to write device-writable virtqueue buffers */
>> +#define VIRTIO_OF_STATUS_EINVQBUF      0x20f1
>> +\end{lstlisting}
>> +
>> +\subsubsection{Opcodes}\label{sec:Virtio Transport Options / Virtio Over Fabrics / Commands Definition / Opcodes}
>> +Opcodes (u16 type) of Virtio-oF Commands are as follows:
>> +
>> +\begin{lstlisting}
>> +#define virtio_of_op_connect               0x0000
>> +#define virtio_of_op_disconnect            0x0001
>> +#define virtio_of_op_keepalive             0x0002
>> +#define virtio_of_op_get_feature           0x0004
>> +#define virtio_of_op_set_feature           0x0005
>> +#define virtio_of_op_get_keyed_num_descs   0x0100
>> +#define virtio_of_op_vq                    0x0fff
>> +#define virtio_of_op_get_vendor_id         0x1000
>> +#define virtio_of_op_get_device_id         0x1001
>> +#define virtio_of_op_reset_device          0x1003
>> +#define virtio_of_op_get_status            0x1004
>> +#define virtio_of_op_set_status            0x1005
>> +#define virtio_of_op_get_device_feature    0x1006
>> +#define virtio_of_op_set_driver_feature    0x1009
>> +#define virtio_of_op_get_vq_size           0x100a
>> +#define virtio_of_op_get_config            0x100c
>> +#define virtio_of_op_set_config            0x100d
> 
> We had a proposal of transport virtqueue that allows using a
> virtqueue[1] for configuring a device. And Ling shan will rebase it on
> top of the admin commands.
> 
> That is to say, admin commands could be used for transport which will
> be duplicated with the commands you invented here.
> 
> I wonder if the virtio-OF can just reuse the admin commands (have a
> quick glance and I didn't find any blocker for this).
> 
> Thanks
> 
> [1] https://lists.oasis-open.org/archives/virtio-comment/202208/msg00003.html
> 

 From my understand, the virtio device related commands looks 
similar(set/get status/features, reset device ...), but not same:
1, the admin commands are executed upon the admin virtqueue, it uses 
virtqueue based transfer.
The virtio-of commands are executed upon a virtio-of queue(established 
reliable connection), not a virtqueue. A virtio-of device could support 
admin commands in theory.
I suppose a virtio-of device with admin vq supported like:
+---------------------+
|   +-------------+   |
|   |control queue|   |
|   +-------------+   |
+---------------------+
|   +-------------+   |
|   | virtqueue0  |   |
|   +-------------+   |
|   | virtqueue1  |   |
|   +-------------+   |
|   | virtqueue ..|   |
|   +-------------+   |
|   |  admin vq   |   |
|   +-------------+   |
+---------------------+

The virtio-of commands ares used by both virtio-of control queue and 
virtio-of virtqueues(include admin vq).
The admin commands are used by admin vq only.

2, the virtio-of commands are used over fabrics, they are defined in a 
fixed size, the admin commands are described by virtqueue descriptors.

3, the virtio-of commands need a command_id field to distinguish each 
other for command depth, but the admin commands don't need command_id 
field(supported by virtqueue descriptor heads).

4, connect/disconnect are fabrics specific, stream/keyed transfer 
related features/commands are fabrics specific too.
interrupt related commands are not used by virtio-of.

As far as I can see, they are quite different, defining them separately 
would be fine.

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


Return-Path: <virtio-comment-return-6926-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5E5C001DF
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 04:44:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id F37821318C9
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 04:44:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D4E78986383
	for <virtio-comment@archiver.kernel.org>; Mon, 31 Jul 2023 04:44:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id BEC1A983EBE; Mon, 31 Jul 2023 04:44:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A8B0E986364
	for <virtio-comment@lists.oasis-open.org>; Mon, 31 Jul 2023 04:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690778683; x=1691383483;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fi9Xm6C9Xjarl0IuVTn+wv+DMvul6IuwST54B5MLV8I=;
        b=RlnatDVkCiNz9nvWQI+ks2uvktXd8j8/cuec8HggA6SXdKAVtG7qam+crdwAv8p+C9
         aajk1Qe3brhycrJ6cfX3mZ5/F4yibkkGwAxFgB8BHi+N1I5U69MF53sYkd7+2ZXwst5Y
         C5hLfDZJ1/YMhxs41q+y9Srr2uNlusx6LOLvsER3Tg3h565ofrud/t7kYvLr8rSm2vt9
         SV1Fl/YSe0Se8PPeBz3oEQLbnjBxYBdv5r0MfPVnLjtSH/Oq58ZvROrkbRyQcAmD1DPS
         doHa0Xr/8/oASZyWTn5HrMXgDZdP+/BC69V4a9m9sqWAMOp5fpr2b039oXC3Z06K8qim
         u0Lg==
X-Gm-Message-State: ABy/qLazU59wWgl6nftG9ro83WCplujEW2QCs5WowwkOdhcWINdJG6oP
	HQq/+mNq2be3YRZdEVGaHUQeMQ==
X-Google-Smtp-Source: APBJJlHGX0oebUOhQ+9sMVmGElkukq7SnH7uYdJz/GytrQLzt916O7k4oB1K1Houu3ZpuLt51JKKwQ==
X-Received: by 2002:a05:6e02:dcc:b0:346:7c6d:c667 with SMTP id l12-20020a056e020dcc00b003467c6dc667mr7010112ilj.13.1690778682991;
        Sun, 30 Jul 2023 21:44:42 -0700 (PDT)
Message-ID: <f71209fe-1a1a-aab1-7205-24d5137f9fe1@bytedance.com>
Date: Mon, 31 Jul 2023 12:44:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "parav@nvidia.com"
 <parav@nvidia.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
 "houp@yusur.tech" <houp@yusur.tech>,
 "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
 "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-2-pizhenwei@bytedance.com>
 <3657EEE8-83D6-40EC-BA23-4BAB3011D2D8@nutanix.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <3657EEE8-83D6-40EC-BA23-4BAB3011D2D8@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: Re: [virtio-comment] [PATCH v4 1/7] transport-fabrics: introduce
 Virtio Over Fabrics overview



On 7/30/23 07:23, Raphael Norwitz wrote:
> Hey Zhenwei,
> 
> Interesting proposal!
> 
> I have taken a pass through the series and have some thoughts/feedback. I see potential value in a way to desegregate device processing from the hypervisor, while re-using a lot of the existing code and well defined abstractions in the virtio ecosystem.
> 

Hi Raphael,

 From the point of my view, Virtio-oF will support several scenarios:
[1] host OS/containers. The host kernel connects the target directly, 
then the host OS emulate a virtio device.
[2] hypervisor. A hypervisor handles request from guest, then translate 
the request into Virtio-oF, forward requests to target.
[3] vhost-user. Like hypervisor, but has a higher performance.
[4] virtio hardware acceleration on DPU/smartNIC.

> For storage in particular it may have some performance impact by cutting out virtio processing from the hot path, but IMO there are better ways to achieve that working out of the box today. Your “eager buffers” are a nice touch for the write path, but come with their own costs I’ll describe later.
> 
> With that, I do see some limitations.
> 
> By design, this protocol gives the guest kernel direct access to the target. That in turn becomes a potential attack surface if a VM is compromised, whereas a virtio-over-{PCI/CCW/MMIO} abstraction shields the target from direct access.
> 

The eager buffer is WRITE-only MR to the initiator, would you please 
give me more hints about 'potential attack'?

> While migration should work cleanly for a TCP fabric, have you thought about how migration will work with RDMA? In theory, as VFIO migration matures, it’s possible the guest kernel and user space stacks could be hardened to deal with hardware being ripped out from under it, but that may be a bit futuristic.
> 

Do you mean the VM migration in scenario[2] and scenario[3]? as far as I 
can see, draining the inflight requests would be fine on migration.

> Also could you ever effectively migrate a VM from a TCP host to an RDMA accelerated one? The guest could have some smart logic to figure out “now my NIC doesn’t support RDMA, let me switch to TCP”. Today if you use RDMA acceleration behind any of the existing transports the guest does not have to worry about this and it can safely migrate anywhere.
> 

Frankly, I don't think this should be part of 'Virtio-oF specification'. 
 From the point of my view, the specification defines the transport 
binding only, the uplayer plays 'smart-select' game.

> Similarly what happens if you need to change the target IP or if one target goes down? Is there any way to handle that without making changes inside the guest? I think you should describe “redirection” behavior like iSCSI has, but I’ll describe more in the relevant patch.
> 

Let's continue this discussion in
'[PATCH v4 4/7] transport-fabrics: introduce command set'

> For the storage use-case in general, I’m struggling to understand the advantages of virtio-over-fabrics over either the kernel NVMEoF or iSER initiator. It seems like it fundamentally boils down to a similar paradigm, the kernel submits IOVs to the target directly and it DMAs back and forth as required. In my experience, those who want to squeeze every last op out of their VMs skip virtio and do that anyways. For NVMeOF, the only limitation is that you need to use NVMe, but given how virtualization-friendly and ubiquitous it’s becoming for storage I don’t think that’s bad. iSER has some challenges but they are definitely surmountable.
> 
> Again, I like the “eager buffers", but if you’re thinking about storage performance, why not rather try introduce that into NVMEoF or iSER?
> 
> Other than storage, what devices will benefit from fabrics acceleration enough to compromise the ergonomics of the existing virtio transports?
> 
> In summary, I’d like to see:
> 
> [1] More discussion of the kinds of devices which will benefit from Virtio Over Fabrics. 

About 2022 Q1, I developed virtio-crypto akcipher service(currently RSA 
offload supported only), this allows HTTPS performance(Nginx+openssl) up 
to ~300% in a guest.

In our product environment, we use a lot of QAT cards as a 
akcipher-service-pool, and Crypto Over Fabrics is used between QEMU and 
server.
Then the VM has no dependence on host server, and support VM migration.

On the other hand, I have a plan to develop GPU Over Fabrics for the 
virtual desktop. So I have to develop a GPU Over Fabrics protocol...

Once the Virtio-Camera or Virtio-Video gets ready, Camera Over Fabrics 
is needed for camera redirect ...

Rather than XXX Over Fabrics again and again, I'd like to re-use Virtio 
devices, a single Virtio-oF is enough. This is the background and 
motivation about Virtio-oF.

> [2] A comprehensive description of what the dataflow should look like. From having read the spec I get the gist but an example flow would be helpful for reference. Maybe just in the cover letter?
> 
> [3] If the goal is storage performance, a discussion of how this protocol provides performance benefits over and above the alternatives.
> 

As the above description, the goal is *NOT* storage performance.
Frankly, I don't think there is essential difference between 
NVMe-oF(multi queues supported) and Virtio-oF blk(multi queues 
supported), but different with iSCSI/iSER(single queue supported). The 
format of command(SCSI/NVMe/Virtio) hardly affects the storage performance.

>> On Jun 26, 2023, at 3:25 AM, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> In the past years, virtio supports lots of device specifications by
>> PCI/MMIO/CCW. These devices work fine in the virtualization environment.
>>
>> Introduce Virtio Over Fabrics transport to support "network attached
>> peripheral devices". With this transport, Many Virtio based devices
>> work over fabrics. Note that the balloon device may not make sense,
> 
> Is it just balloon/shared memory devices that don’t make sense? Does virtio-net make sense?
> 
> Virtio-oF as described has fundamental drawbacks for SCSI in that a single virtio-scsi controller VQ may service many different iSCSI targets and your proposed protocol has one connection per VQ. Connections are likely to be made to different hosts for a single controller, so you’d have to create some abstraction to allow for multiple connections per VQ, or (more likely) rework the virtio-scsi device definition specifically for Virtio-oF.
> 
> 
>> shared memory regions won't work.
>>
>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
>> ---
>> content.tex           |  1 +
>> transport-fabrics.tex | 32 ++++++++++++++++++++++++++++++++
>> 2 files changed, 33 insertions(+)
>> create mode 100644 transport-fabrics.tex
>>
>> diff --git a/content.tex b/content.tex
>> index d2ab9eb..bbbd79e 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -637,6 +637,7 @@ \chapter{Virtio Transport Options}\label{sec:Virtio Transport Options}
>> \input{transport-pci.tex}
>> \input{transport-mmio.tex}
>> \input{transport-ccw.tex}
>> +\input{transport-fabrics.tex}
>>
>> \chapter{Device Types}\label{sec:Device Types}
>>
>> diff --git a/transport-fabrics.tex b/transport-fabrics.tex
>> new file mode 100644
>> index 0000000..d10be2a
>> --- /dev/null
>> +++ b/transport-fabrics.tex
>> @@ -0,0 +1,32 @@
>> +\section{Virtio Over Fabrics}\label{sec:Virtio Transport Options / Virtio Over Fabrics}
>> +
>> +Virtio Over Fabrics (Virtio-oF) enables operations over fabrics that rely
>> +primarily on message passing.
>> +
>> +Virtio-oF uses a reliable connection to transmit data. The reliable
>> +connection facilitates communication between entities playing the following roles:
>> +
>> +\begin{itemize}
>> +\item A Virtio-oF initiator functions as a Virtio-oF client.
>> +The Virtio-oF initiator sends commands and associated data from the driver
>> +to the Virtio-oF target.
>> +\item A Virtio-oF target functions as a Virtio-oF server.
>> +The Virtio-oF target forwards commands to the device and sends completions
>> +and associated data back to the Virtio-oF initiator.
>> +\end{itemize}
>> +
>> +Virtio-oF has the following features:
>> +
>> +\begin{itemize}
>> +\item A Virtio-oF target is allowed to be connected by 0 or more Virtio-oF initiators.
>> +\item A Virtio-oF initiator is allowed to connect to a single Virtio-oF target only.
>> +A Virtio-oF device instance is a virtio device that the Virtio-oF initiator is
>> +accessing through the Virtio-oF target.
>> +\item There is a one-to-one mapping between the Virtio-oF queue and the reliable connection.
> 
> Again - there are drawbacks for some device types (i.e. SCSI). Maybe soften the language to suggest that it could be extended in the future?
> 
>> +\item There is one, and only one, Virtio-oF control queue for a Virtio-oF device instance.
> 
> Any particular reason for that?
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


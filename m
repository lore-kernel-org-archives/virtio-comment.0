Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D695236A62
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667208; cv=none; b=fYF8mVt4g3kAd1amcnm3DiXhgbumsUWzhrfc4kOQSnSJZTySJEOcIYBRr4OHplfD1Z2WWqmva5ezO/3u35dJDMYrOjdSUHgCcL9m6OAeGpb78TCQhRicM3xHaTEVTAgWo8j05wW5Ps/Jy7+cvSXyYLJUvmJEB3NuHpjHaG11E3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667208; c=relaxed/simple;
	bh=MMSlk0yE6ZkAGDCjB3wnWsWx1QpImSC7xbDQkSWgLI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ml55F9XldPc09qMrNQbcZazRTRHONrHjoYGsC/Iy568Is5+vZ11ZPI3cwd9/YxYQ2dNGU5NiY7NJSRoP2ugrXVl6lOjnkht0YlLr5jDJBJmtX1ZDwB9caQuIYtgWyIjiw2xZZG6Vp/+DGfYor43UCwLyCW94haTByX/KXB9mUjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kHrdIU6+; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kHrdIU6+"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4721aede532so9755371cf.2
        for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 06:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740667205; x=1741272005; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hfqGEnH1zsi90WG5moiK284lqrnXszOVJWx6wmnnDN0=;
        b=kHrdIU6+R/IqN+k6wxC/Mt4VCSsaRst4W5aFvWTwRjtKSr5aw3Bw9W+R7Fq6uxz8Za
         duchkxENnz1XKFUaWOh22Egtc71dZeX5Eb7rjCk1xjvNxsfKc5oOjiJnrckB3vS9mo+Y
         J6IXgDs8gv4i/RlCl+uXv6bziGNWM2q1VdDuIDYQB9ad/1hSoF9qBvMNsAmTi8LpCv61
         LG/IDrgfhGSE1hj9cuVIP4heDqkrcWfqKPVO55Y4VxJ3qK5f59VshpxH9W9GV2rtfhMX
         BoLFUeOsqTru5LHMnr8SGcZaILqiinPmK6iBJxjHNngkv8yN+Ow8/OHZ7B2oT5ciAR6r
         eDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740667205; x=1741272005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfqGEnH1zsi90WG5moiK284lqrnXszOVJWx6wmnnDN0=;
        b=ueS17quMe2nL/jzPLPbiydk0z0ZBhT8nVUwfcXUmBbjqmyKIs2nMueXeHsMEkr/tvv
         mgw4/a4wR8VUOfRSjubrdMYT08wFtvMmba6hRW4fHDM+kmygew8KDCKZV6SFHVHR1PAi
         AUF5tUObcCrnRgrHD9/Ou0xxHRzsmP/BwlwFxwJYLCenr+lesOuDAN02qkjJryFsMXlw
         PLuhJUGN8RfEiB5ccdtL47nxX24sUA7YB2h4+bgT9S4SybL+yGNe5OSCEozAHJ6gzcRs
         D4mVEC04ReGvzyrDFNBjuX2G5b1lrMbwJsEYcygkX0brKi4Hi06t07Ta13Cc7EzpV7SK
         fKPg==
X-Gm-Message-State: AOJu0YzBrsve4B6S+R5pcY60QnfJBiNdd0u7AbtbuHUiwMZmOCeBYpL5
	htUfWxw2xKMuG7mbeF2ujqW9kGNIg8QQv+wjGzcO1ZqC9rlN98AKkI3aKaaqhAo=
X-Gm-Gg: ASbGnctEk4izVUF1np56QXAcmzjzvwoa2S45roxrQixWqn6zB3EAHnHMiFQw13AulMg
	bXaQuSHJ8MT1+z3R4l6u32xsGZSrEVZuPzhBShdboRGPyX0tpAEkSQm4FSODVUeh/ujo7f8V7eN
	0MuXsnv+PnBRiE1fEvVy2hhPQqytGTp2wcxgBYyP0ako8CH+oD0PvYUNuh8vF/ZA9WFWPbNQ5JF
	3EvS/hLUbYrT4siOQzd9J3tebN7OfciaCMs6hby9QUVX/fwoyacQj6f/TTAnEmXO6N+NhuN0ve6
	T/tmanCwmdtOrXkb4cViaC5T98eM8zZgYpbGSZwSvo0OW09CuzAVgtexUSHxyVkRFBur0QKtACo
	=
X-Google-Smtp-Source: AGHT+IH4n0SUkDxC9uJp84hDCmUSvp4uXoDUFhlHyB12/hYqy0t4z48yaxtAxasyRkuhEjPzoR9RfA==
X-Received: by 2002:ac8:7dc2:0:b0:472:17b5:dc44 with SMTP id d75a77b69052e-4722473c3efmr313326771cf.12.1740667205170;
        Thu, 27 Feb 2025 06:40:05 -0800 (PST)
Received: from [192.168.2.7] (pool-72-83-14-124.washdc.fios.verizon.net. [72.83.14.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47472432d52sm11415411cf.79.2025.02.27.06.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:40:04 -0800 (PST)
Message-ID: <2f095da4-44a8-48ae-a078-60ec3e04d3b8@linaro.org>
Date: Thu, 27 Feb 2025 09:40:03 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org>
 <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
 <CACGkMEtxuSZ-Qk7kP8fEzLG1zo3a-=XuZKhd1J5h7ZtFQT3JMw@mail.gmail.com>
Content-Language: en-US
From: Bill Mills <bill.mills@linaro.org>
In-Reply-To: <CACGkMEtxuSZ-Qk7kP8fEzLG1zo3a-=XuZKhd1J5h7ZtFQT3JMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason and Michael,

Thanks for taking a look, we appreciate it.

On 2/27/25 3:34 AM, Jason Wang wrote:
> On Thu, Feb 27, 2025 at 4:32 PM Jason Wang <jasowang@redhat.com> wrote:
>>
>> On Thu, Feb 27, 2025 at 4:09 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>
>>> On Tue, Feb 25, 2025 at 08:48:00AM -0500, Bill Mills wrote:
>>>> This series adds the virtio-msg transport layer.
>>>>
>>>> The individuals and organizations involved in this effort have had difficulty in
>>>> using the existing virtio-transports in various situations and desire to add one
>>>> more transport that performs its transport layer operations by sending and
>>>> receiving messages.
>>>>
>>>> Implementations of virtio-msg will normally be done in multiple layers:
>>>> * common / device level
>>>> * bus level
>>>>
>>>> The common / device level defines the messages exchanged between the driver
>>>> and a device. This common part should lead to a common driver holding most
>>>> of the virtio specifics and can be shared by all virtio-msg bus implementations.
>>>> The kernel implementation in [3] shows this separation. As with other transport
>>>> layers, virtio-msg should not require modifications to existing virtio device
>>>> implementations (virtio-net, virtio-blk etc). The common / device level is the
>>>> main focus of this version of the patch series.
>>>>
>>>> The virtio-msg bus level implements the normal things a bus defines
>>>> (enumeration, dma operations, etc) but also implements the message send and
>>>> receive operations. A number of bus implementations are envisioned,
>>>> some of which will be reusable and general purpose. Other bus implementations
>>>> might be unique to a given situation, for example only used by a PCIe card
>>>> and its driver.
>>>>
>>>> How much of the bus level should be described in the virtio spec is one item
>>>> we wish to discuss. This draft takes a middle approach by describing the bus
>>>> level and defining some standard bus level messages that MAY be used by the bus.
>>>> It also describes a range of bus messages that are implementation dependent.
>>>>
>>>> The standard bus messages are an effort to avoid different bus implementations
>>>> doing the same thing in different ways for no good reason. However the
>>>> different environments will require different things. Instead of trying to
>>>> anticipate all needs and provide something very abstract, we think
>>>> implementation specific messages will be needed at the bus level. Over time,
>>>> if we see similar messages across multiple bus implementations, we will move to
>>>> standardize a bus level message for that.
>>>>
>>>> We are working on two reusable bus implementations:
>>>>
>>>> * virtio-msg-ffa based on Arm FF-A interface for use between:
>>>>   * normal world and secure world
>>>>   * host and VM or VM to VM
>>>>   * Can be used w/ or with out a hypervisor
>>>>   * Any Hypervisor that implements FF-A can be used
>>>>
>>>> * virtio-msg-amp for use between heterogenous systems
>>>>   * The main processors and its co-processors on an AMP SOC
>>>>   * Two or more systems connected via PCIe
>>>>   * Minimal requirements: bi-directional interrupts and
>>>>     at least one shared memory area
>>>>
>>>> We also anticipate a third:
>>>>
>>>> * virtio-msg-xen specific to Xen
>>>>   * Usable on any Xen system (including x86 where FF-A does not exist)
>>>>   * Using Xen events and page grants
>>>
>>> I am also interested in virtio-msg-admin-cmd, sending messages to VFs
>>> over the admin commands of the PF.
>>
>> One more thing, there used to be a similar proposal which is the
>> transport virtqueue which also defines the message. And it has the
>> chance to be unified with the admin command. Need to think about the
>> (dis)advantages of each proposal.

If you are taking about replacing virtqueues with messages, this is a very
different concept.  That certainly has merit but is not this model.

The size of "direct" messages in FF-A has to fit into registers and normal
world to secure world needs direct messages (I am told.  I am not the
secure world or FF-A expert).

In many of our use cases this would require one or two more memcpy's for
the buffers.

If I am wrong about the context of you comment, please let me know and if
you have a reference that would be great.

>>
>> What's more, if the actual method to send and receive the message,
> 
> I meant "if the actual method to send and receive the message is
> implementation or architecture specific".
> 
>> can
>> we still call this a transport or not?
>>

Yes I understand the issue.  It is really a spec for a family of transports
that have a lot in common.

virtio-msg-ffa will be a fully specified transport.  We do plan to write a
spec for that but it will also include lots of FF-A specific things and
include details about how to setup shared memory areas, map them, and how
the bus addresses in the virtqueue should look like.  These are details
that are not normally addressed in the virtio spec.  I think Arm was
thinking this would be an Arm document adjacent to or included in the FF-A
spec.  I could also see it as an appendix to the virtio spec or something
similar.

Likewise, the virtio-msg-amp will be a full transport layer but will need
DT bindings to find its shared memories, know how to map that memory, what
IRQ to expect, and how to poke the other side.  It will also be able to be
used w/o DT from a PCI driver that knows how to specify these things. I
plan to also write a spec addendum for virtio-msg-amp.

All good questions and comments.  Please take a look at what we have right
now for the big picture and we can work the form

Thanks,
Bill

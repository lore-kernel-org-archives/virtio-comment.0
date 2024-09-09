Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1ABFC19
	for <virtio-comment@lists.linux.dev>; Mon,  9 Sep 2024 08:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725869116; cv=none; b=AeQk9qIwAmGoBQdssnqWVQbv3ICXAZG0frh8D8fD51BbGSrfuyvvWqze7eWumsW9aKgMR/T8eTDCaSGRuKFEwXCRM/9YphCdKU4Up5AyMWsz/9LwiXUR+P7jTS3ogDw2knwE3MBP/EPwVOS3rR2xp5cEvYjuURfQtT4nItkl7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725869116; c=relaxed/simple;
	bh=CJn0PqTpKfHLuB3CduwCBcmJN8V8FomZbQjX0NruCv0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkKVLC8uXmsbpVSvOmIX3FIj5mdrxJ9XvClfBfUQ1dn4JPZuCDuJljVGPt5aTj4dHWazSVMczwaMXRREZDjG9aZntLleDncWmSgIAjmr1/Zfadzcg//t+5aSir+qnJAgfkfIbr59wsilD7ZMW7GlXO9JGn81VvREmW1sroL+ny4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VIByEHJj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VIByEHJj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725869113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pnQgszGc6SDL8pNTv4SNd+dAEgzBSuoOHN9odRUIKS4=;
	b=VIByEHJjwqaOiaZiQvgBZGWZJMPkWlv89waIAnyDL3pLUuaksGy8DSIWC+BzTWEIBqwj2e
	mWjcCIXFy3MxKLBgJXqgexTxXyC6JrjOdr01ms6VTw19D1v58t0FSEDawu7x4xufqCegWe
	xrW9KcFoNTY/Kic5vKO2YAsGxjon5v4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-PL-xwRLBN1-u8aiBKJc3eA-1; Mon, 09 Sep 2024 04:05:12 -0400
X-MC-Unique: PL-xwRLBN1-u8aiBKJc3eA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42caca7215dso15037425e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 09 Sep 2024 01:05:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725869111; x=1726473911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pnQgszGc6SDL8pNTv4SNd+dAEgzBSuoOHN9odRUIKS4=;
        b=gXbw1RYazRUdovYMYVmSlIXQ+GZ9aGdhTKAs9ZHJlfxXrqUDJf2BXtdgxxRS8TABxf
         +A2cpVzu5HC3+OGCUAf7OssgUBejGUDwTt6S8gelKw+qDf52UPrTYef2SrtMWJkdQuqf
         pDBO48EFAqLITM8DdQynIAwyBpQHz6TdfxdRYGyX3xOVdSx3ANK7nkak3lzr/ykXcWGT
         PJKKXbRsBb4lYbctk88kqmv5KVUiEeVneRQMWnN2k9XQq6q7DCnNS4qSv/kPTcHX+nq9
         5ct2Nm9Fe0IVbVi7TN14GHjauf5c166RudRbzcbAiBbbezdkVPsjfsXTF6kE/TI8+w6g
         fb6Q==
X-Gm-Message-State: AOJu0YwWX16t4KPP9Dn0pd4dC0YC/Vi84AwQBZoUlaj8cX8dpGMvPsJK
	b6IUnNcs9nedgEKDPdJXLwzZf44K8wTwn12DMoxHX+T21O0bRZjCt2Ge9StdetOwTSgK1dR13Yh
	B9ut6VZisXXy8KwFBeiedGY8Xtd2nedQZwe2ozrIgIvF3i+uAl7j2f4jhdU+q3D9b
X-Received: by 2002:a5d:4145:0:b0:376:27b7:da81 with SMTP id ffacd0b85a97d-3789268f0b1mr4060572f8f.22.1725869111177;
        Mon, 09 Sep 2024 01:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFQNTKYzHJ3O+INebaD6c3YANty+IRfFnHkxu27AKwGbf+Sr+mGlv9DvbIRo+dHCAP/7kxw2w==
X-Received: by 2002:a5d:4145:0:b0:376:27b7:da81 with SMTP id ffacd0b85a97d-3789268f0b1mr4060546f8f.22.1725869110598;
        Mon, 09 Sep 2024 01:05:10 -0700 (PDT)
Received: from [192.168.88.27] (146-241-69-130.dyn.eolo.it. [146.241.69.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37895675b21sm5334568f8f.49.2024.09.09.01.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:05:10 -0700 (PDT)
Message-ID: <45c88725-bacd-4999-919c-4191ea0cbdfc@redhat.com>
Date: Mon, 9 Sep 2024 10:05:08 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/2] virtio-net: define UDP tunnel offload
To: Jason Wang <jasowang@redhat.com>
Cc: virtio-comment@lists.linux.dev, maxime.coquelin@redhat.com,
 Eelco Chaudron <echaudro@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Willem de Bruijn <willemb@google.com>, kshankar@marvell.com
References: <cover.1725463935.git.pabeni@redhat.com>
 <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CACGkMEsXhsTpZg2DP5BqUOodjR1HOTc-a-FuaCbxffZhpPj2aQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 9/9/24 05:16, Jason Wang wrote:
> On Wed, Sep 4, 2024 at 11:50 PM Paolo Abeni <pabeni@redhat.com> wrote:
>>
>> UDP tunnel usage is ubiquitous in container deployment, and the ability
>> to offload UDP encapsulated GSO traffic impacts greatly the performances
>> and the CPU utilization of such use cases.
>>
>> This series introduces separate features to handle both UDP tunnel
>> segmentation offload (patch 1) and UDP tunnel outer checksum offload
>> (patch 2).
> 
> Looks good to me.
> 
> And I wonder if there's a link to the prototype code so I can have a
> double check.

I still have to refresh the code from first implementation - that was 
the base for the first draft here some time ago.

In the next 2 weeks I'll be traveling and/or AFK, I hope I can share the 
code a little after that.

Cheers,

Paolo


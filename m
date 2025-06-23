Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF83566A
	for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 07:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665219; cv=none; b=OmSlv1FRgvIbtAGIeOOC1ORmbWOzcVJXz0/P0z+5J4eeCTNNSbk5novOzf/a3FZqcuJhTYe6JVUHA5ANkrSlejVNY7SaiHqGX6yCMNssej//fsbms/laMX8kJAOY1ByUeTWhjTEbAsvx17I/5FBLMbREwkUExpquWGGB/sTez9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665219; c=relaxed/simple;
	bh=g9aRHKq2rKvXTag0EHbXGpCN/49qNY7tkICLskMB2Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nEeM+ucIaeUNFI+IR3y31eYtTwy9d2iJ7D6B0abVV8aCYBVmjn4oQSq92toFf1W6sEy6a58wwL9cwFIiemRSR7+oyqrToQSQR6sa3wYL7MiTCzM4l2ro1FDG5dtpnod4Oe25jf9TWmwJb5+8UTo0nb/VmGz3lHK33cyEn/wdmzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFtSNysY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFtSNysY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750665216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ID3YpE4nHXkCLX2aABszgzLctY5RZwgktq82zMnrREs=;
	b=YFtSNysYqHbSLMNgmU3J/W9AaazvuS3wDVj7feVkV3uztKjntKn5w2ga2CGEAZHH31H58Q
	FvjFcetQsWlFppLgq7tv0zKu3HmyxCD/WQkXJ09sbAdpDI9nIYG5WycZ55BZwZugqzUNca
	kc+Q31QGVnDWUzqcH4BxSR959xuLjBM=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-4Ethk__eODeubNMNwV1Pzw-1; Mon, 23 Jun 2025 03:53:35 -0400
X-MC-Unique: 4Ethk__eODeubNMNwV1Pzw-1
X-Mimecast-MFC-AGG-ID: 4Ethk__eODeubNMNwV1Pzw_1750665214
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-747dd44048cso3147537b3a.3
        for <virtio-comment@lists.linux.dev>; Mon, 23 Jun 2025 00:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665214; x=1751270014;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ID3YpE4nHXkCLX2aABszgzLctY5RZwgktq82zMnrREs=;
        b=uxYffDH4Iyx41cCX1YkSrl+IrDkpAMlLj3iyqKZPJwFJCo0vhOYtu35BeKnUegsWDr
         e2O5RSka/lVdXfAsWXgZXw6ZvC5OCS1QEsSldabqY9AnNzPzUXPgvXodbLW+jQGlGFYd
         IXSr3z72HTxqdn5bWijU3l51Z4/m0TTnTVshS/Qs1vbN5sA9PM+IoWVWKE05YQwdAmtJ
         bJLoWK4gC881Yz4G8tc+jyPN29vgi7JjeNXZ3rd916I9rneNGl+wrpNMWpCYlzJ5/hcd
         eijh4g8GbiAGFj0Cyvivqzn25fcPTGNUTopii3zXEQAFcH6IDzRuVaFaQcl2rDZj3zSD
         TCWw==
X-Forwarded-Encrypted: i=1; AJvYcCVEy34uep4z9Z5ZtunbgMe/R+FsNZ9fOB9E3eJjWL8YGC2nC+1wuPG4rbn4DFusrYORGczLPggt6rHiAvZH1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx35KZOgcvCeq1LUgERNEEHRV0elCFe7/++vz0vlwImzrJNaGlH
	tERHx4//u2Uji/n9pQ6KpcJBxh5eLh8Ad4qLhster2nif/vgNlFlDc4qexk/cGFxUdhuSclw1Gi
	w8+SVyYKfU5KD3GKhcYbeGK+nlJ3eGJ0o8F8oT22Ou2kQ7yi2cmy686aWjllhwJCePTXcWXmr+0
	fj
X-Gm-Gg: ASbGncswgQYQKT92cAPUQgMj4QlwkSrpgE5vSk1oPs3+OPjlHfB9EZr0O18QtGh0RGO
	U+xXaezOfgpjfQN+ytamCjIKRS2Ed4i6cUNvpcwMZedq/SFQnY0p5XThaFGovgWgyDBrne6q3FI
	HWodfKhhwk5rr9L6b4rwPLEVTaVncoF6XSCzl+eWGvLrU1apbo5YTHFCHdydfIqida6V7LuMCSv
	nRWI+mbMYW2We0RA7kP4U3xX+bkFnKiTE3Uu1F2R/RGA/fqNOAxtmdlPDFqTLnvWHfRR1AroB3h
	sXtX4RSaLzb6OLspFwHE5W6x3do=
X-Received: by 2002:a05:6a00:4b10:b0:740:6f69:8d94 with SMTP id d2e1a72fcca58-7490d5e13e7mr15225516b3a.0.1750665213809;
        Mon, 23 Jun 2025 00:53:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwLsG+fOK51vZuAoIo8VmBJPht081NkOmaKGXJ7k4wepJHSQ3B6Iv2L5naPMGdrPWazXXY7w==
X-Received: by 2002:a05:6a00:4b10:b0:740:6f69:8d94 with SMTP id d2e1a72fcca58-7490d5e13e7mr15225495b3a.0.1750665213361;
        Mon, 23 Jun 2025 00:53:33 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.202.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74939b5013csm2692780b3a.24.2025.06.23.00.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:53:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 09:53:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xuewei Niu <niuxuewei97@gmail.com>
Cc: parav@nvidia.com, fupan.lfp@antgroup.com, mst@redhat.com, 
	niuxuewei.nxw@antgroup.com, virtio-comment@lists.linux.dev
Subject: Re: [PATCH v7] virtio-vsock: Add support for multi devices
Message-ID: <ntpwwmwwaow4lfdjubgdwsvvpzpkuc52iz3vjztbx4iphvpnem@gmd2bsqckonm>
References: <CY8PR12MB7195BE725E1871233857FE57DC7DA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <20250619051033.1433974-1-niuxuewei.nxw@antgroup.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250619051033.1433974-1-niuxuewei.nxw@antgroup.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ssVbBDBaUQMZjh0ogTlZGUt5B7iN3Ep1-m0C7I8hq4U_1750665214
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 19, 2025 at 01:10:33PM +0800, Xuewei Niu wrote:
>> > From: Xuewei Niu <niuxuewei97@gmail.com>
>> > Sent: 19 June 2025 08:57 AM
>> >
>> > Hi Parav,
>> >
>> > Could you please take a look at the diagram in [1]?
>> >
>> > IIUC, for VM0, there are two groups, and for VM1, there is only one group.
>> > Am I right? If yes, I think the group concept is reasonable but we don't need
>> > at this time.
>> >
>> > I think the first thing is to figure out how to pick the right group.
>> >
>> > Standard socket doesn't provide a way to access the group information.
>> >
>> > Source and destination are from `bind()` and `connect()`, respectively. If we
>> > don't call `bind()`, only the destination is known.
>> >
>> > However, only destination is not enough to find the group. For example, the
>> > well-known CIDs (e.g. 2) are valid for all groups.
>> >
>> > 1:
>> > https://lore.kernel.org/virtio-comment/20250618095139.1412138-1-niuxuewei.nxw@antgroup.com/
>>
>> Right. Sock addressing scheme is naïve presently to select the group. 
>> Not sure when/how you or others plan to do.
>> This is transport layer problem to solve (not to confuse with transport = pci/mmio etc).


>>
>> However, at device level, we should have the construct of grouping.
>> Without this construct, all devices will be part of single group and one will not be able to build the group concept later.
>> So even if you don't need it explicitly now, grouping the device is what you need when connect() is called.
>>
>> So I was imagining a relatively simple scheme:
>> For example, virtio device level, some kind of group id is present.
>> So two devices which has same group id, are part of single group.
>> An example group id format can be a UUID.
>>
>> And this is completely optional for devices to implement.
>> Generic enough and usable beyond just vsock device in other use cases 
>> we discussed in past.
>
>Fair enough.
>
>@Stefano, could you please take a look at this? I'd love to have some 
>input
>from you.
>
>A brief summary of the idea is: The config space will be extended to
>include a group id. The devices with the same group id are considered 
>to be
>in the same group.

Thanks for the summary, but please avoid top posting, otherwise is very 
hard to follow the discussion :-(
https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

I like the idea of groups. What is not clear to me, is how groups will 
allow the driver to select the default output device when the source 
socket is not bind to any source CID. But if it's already discussed, 
please go head and I'll check the next version.

Just a note, AF_VSOCK is suppose to be very similar to AF_UNIX. It's a 
point ot point connection, we don't have any transport layer like TCP.
What we call "transport" in AF_VSOCK world, is usually the driver/device 
usend to send data (e.g. vmci, virtio, vhost, hyperv).

Thanks,
Stefano


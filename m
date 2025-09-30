Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A631B4236
	for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 12:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759234631; cv=none; b=We12p1Awnfp1NIPgsvTamXN6UXW0BoOdIZIP0cDP4WxOnV0pwuMc3uzzcl8CNEz3KELePWJu27Zpu/eIJGSmfKvUrYqLnVuIGfdwf4IvSEDqpnGRudD8NYLdeJoDXiXh2VFr8GMvedKlJbVaZ9fgKQ7JACP43SiESq6hWtYtkkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759234631; c=relaxed/simple;
	bh=ajLAxMS3CJvVO1rswoyJWCoeqTsa9W9reWYpAxJKHag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=pYcfqILJE01KQqPzuogNBhDgZyCVqeINHQSSxBeCWILbGPx7RRDrQ5BEck2FzXX+WK0UjTMGcB2Tg4a1nwimoeNVnNN13O36vOXTJt5mrgHBxPVVQPKp3AWbmpPpKl7/OASKYUAFtGvJMfAaIJYPtyEC3q41jOTG9wihxCGXH3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Nh1AI+M/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Nh1AI+M/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759234626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QAC8Qz6kNWzxE+UV7OsQyTZym+U8Kjzq/YOHQzqaw3E=;
	b=Nh1AI+M/GlM+gYx6Xbo0je2vdJVmBjyT/Lqf5tvcNwuu4hSUDqQ1mnsZZPVWPGfNxvTa+/
	l3XDjl7AZTEf/6tpoOi911xrZiFILDxRGR2qu1dca1I9NuxUxc82EpFtIDSIR02E0I0uM+
	jOSClxvNOmhFz9qOr4/rnBZfa8XNyDE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-6cDQgQNGOTCrjOjJA6eTqQ-1; Tue, 30 Sep 2025 08:17:03 -0400
X-MC-Unique: 6cDQgQNGOTCrjOjJA6eTqQ-1
X-Mimecast-MFC-AGG-ID: 6cDQgQNGOTCrjOjJA6eTqQ_1759234622
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3ee12ab7f33so3067712f8f.2
        for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 05:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234622; x=1759839422;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QAC8Qz6kNWzxE+UV7OsQyTZym+U8Kjzq/YOHQzqaw3E=;
        b=J2ee7fyBN5iwQ7NWzeTtvw5Mnc7U3mDlUzH31IKMcs2MeUcGtjyvrgAjPctf23ZORK
         iqxtyySiUjzyklDUPaszYbtHElSjFiCc3pFSabcTb16j7YVoPYlAWAP5/UUHIRCe5EAz
         btIn7QprcCW7UXjYbJCd6Km2zhJ27i4Nmmtw461FD/O2Qrpx3og3gQNi6R9SPAgEst8h
         hNXdhL7SghDFeW557my+pahKw2yOYUn3L+Yun3abml53rf4Og0EI8wf1qAX7VCK/DFNz
         W8HmkBNkD//wHEMCtWDHwyspqpRqdwEiyC123OxGLZclIxBVNuOgMfez8K/hrUDohtW2
         ONOg==
X-Gm-Message-State: AOJu0YzszWh6r7MZw7UHLceYooCna6fveJpEahOBYymU0hEy4YTwJWou
	/rOIOPQI/dOZMiY4Bj0sazXy3BYwgtR588kcZGjlhORyqZxeE8xsuQBiQ/5vvzQHghlgzTTbA6N
	2B2fAa5rl991tv9idCG+9efhrnEFlklbvC8ZvdkJQenRPLorUFhhODMsNOVurscEnpbFXgnR5Xw
	f6
X-Gm-Gg: ASbGncuElBxkjXNJg94YO16xMqaDg6EaMLOG4tLbifnSF+pSQQMZd9Mc1ixiQ363vOn
	DybpnffidD8RxjLGkk7S6a83h/lf3hXkjuMZB/L0BCu9cbL0HaltOJ2mYeztt76q68xDFTZqXW/
	JkOTwUBYEEmXiE8nktMJr8H/LBxAdbdBCimsm5HcRF21WLbxiKozBG9NAIRpGai4NHhGrMayH+7
	rnKk6rVUyVBxdOt3U2KbILvBsH+0BoW9+oUYV+rWGGfwdinTWaH9H2y67Pp705Oq6SPfqFJgyhG
	sVxS1Hrh075jgfFOm2OB/KfjeD7ID1eAhjviPv4=
X-Received: by 2002:a05:6000:2512:b0:3fa:2316:c20 with SMTP id ffacd0b85a97d-40e462373d3mr20978879f8f.5.1759234621993;
        Tue, 30 Sep 2025 05:17:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDz56XzQ5S7L6NqEdFJ4zflNMZE6VK2w0KVZ5pLimuUQQ2TLLS8VaOAKxaALoMoEzGorf1EA==
X-Received: by 2002:a05:6000:2512:b0:3fa:2316:c20 with SMTP id ffacd0b85a97d-40e462373d3mr20978849f8f.5.1759234621415;
        Tue, 30 Sep 2025 05:17:01 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1518:6900:b69a:73e1:9698:9cd3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c3cad50sm12214265e9.3.2025.09.30.05.16.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:17:00 -0700 (PDT)
Date: Tue, 30 Sep 2025 08:16:57 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev,
	Cornelia Huck <cornelia.huck@redhat.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: Re: Use of LaTeX for the specification
Message-ID: <20250930081514-mutt-send-email-mst@kernel.org>
References: <87ms6dl3sh.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ms6dl3sh.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o5STUHhr1uXEmTde3YyrQPxo_bfR0B-U7Vj-EMSVq9c_1759234622
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Sep 29, 2025 at 03:41:18PM +0100, Alex Bennée wrote:
> 
> Hi,
> 
> I recently updated my distro to Trixie and found that HTML generation is
> broken. As far as I can tell this comes down to the use of \cline as
> shown in this minimal example:
> 
>   \documentclass{article}
>   \usepackage{hhline}
>   \begin{document}
>   \begin{tabular}{ |l||l|l| }
>   \hline
>   Bits & Device Specific & Purpose \\
>   \cline{1-2}
>   Read / Write & Device Specific & \\
>   \cline{1-2}
>   Purpose & Device Specific & \\
>   \hline
>   \end{tabular}
>   \end{document}
> 
> which results in TeX ending early:
> 
>   ! Undefined control sequence.
>   \f:HBorder ...border-top:1px solid \#\hline:color 
>                                                     ;"></td>
>   l.8 R
>        ead / Write & Device Specific & \\
>   ? 
>   ! Emergency stop.
> 
> I'm liaising with Debian and the TexLive authors to try and figure out
> whats going on. However it does raise a bigger question for the
> specification - why do we use LaTeX?

Frankly because there's a template someone else wrote that
makes the output fit OASIS required format.


> I don't doubt that is a powerful typesetting system but its arcane
> syntax is a bit of a barrier to entry especially for casual
> contributors. With the recent breakage I wonder if I'm the canary in the
> coal mine and this will potentially be a problem for everyone else once
> their TeX setups upgrade.
> 
> I'd like to augment the repo with some GitHub actions so we can keep an
> upto date rendered draft available as well as some lint checks so we can
> avoid introducing dodgy markup. But firstly I want to ask is LaTeX the
> right source format for the spec going forward? Is this something
> mandated by OASIS or just an accident of history?

OASIS does not mandate a specific format, but it does mandate
specific *formatting*.

> Thanks,
> 
> -- 
> Alex Bennée
> Virtualisation Tech Lead @ Linaro


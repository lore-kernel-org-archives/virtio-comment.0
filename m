Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D0824167A
	for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759219409; cv=none; b=GyKTSBm0nHYmpIklm9L6wxRvXRDYuwh2Uq5eljrOBc54Z3vlIw5CXFQ2tp7evP0fu9AQKIJ1qAGSpPtnkfzWqxO7JPbE3/HW9bkSGUuWtoMy9xOmNsAHAb86UHwrZx2EtmM/B7VY5/uwuG7Eon7MScQnPVmyciOtLLJBRj6f+L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759219409; c=relaxed/simple;
	bh=kw4FZ9fmTzxAzx+7yNm3slnDglnm7VyD9kYJG6KXVRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GpalpNTmwz9WYmsP0b5mP+hkWRAtXe0eX6KIolZVOyjDbg7by308NSLe0PI94ySwUSIMSPIbk/RV6JNeoE81mXD5U3zUZr5dY2mEP+epltHLoqI1pG+Q+liVy/r2iWVl9Wea+jafIgHDQvfKd6cqR6MVkOOoj3dvqodeMFVP9XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b3L+WbdL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3L+WbdL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759219407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mja8ybE2Db0VjhxGqBMIn4Tw9/6lO0Ttc5wziFAeqvs=;
	b=b3L+WbdLJYbv6yKff6J/8mJMorDcbJCimJSOFRtNoMbAFEehuSabyp1w0W55rNUiX/lnC3
	JJbnYCX6QHgd2kevm51fXlLmMaa1lUU+vnNqxBRf1tP9ES0uT6NEYDolKAQq//GJVEXHzJ
	TUn8e4TBAcfwjD7NmwBnzrph21pRogQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-XDTidfryNuO038f3p4yOIw-1; Tue, 30 Sep 2025 04:03:25 -0400
X-MC-Unique: XDTidfryNuO038f3p4yOIw-1
X-Mimecast-MFC-AGG-ID: XDTidfryNuO038f3p4yOIw_1759219404
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-46e39567579so27405785e9.0
        for <virtio-comment@lists.linux.dev>; Tue, 30 Sep 2025 01:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759219404; x=1759824204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mja8ybE2Db0VjhxGqBMIn4Tw9/6lO0Ttc5wziFAeqvs=;
        b=Jmpph+cM3QifBHjA+oiyQvfxabmZXp2XGvxBdRUd+4wpkkDBsyKCjASohQIBgiJeAs
         aK24cOHiKCY6meptuoTjRevh8eoQ2AbTcc6JS4C2aWnKbIoKN91K1zgC3kDuM+dYESwO
         CEbm4W/Uvl112hjBEhAoTMGILBgVCwteqaLNW1QXnCTI0UqbNaLad5FKpyWooKXxB3Eh
         aQDgeTf/ESvgCCnwOwgIPSL5Ej9mtUHRMri1R9usuWTxLlQpp0QEYfoaO8xqqHtCUOBk
         uhzqTn5vSiQO7cAz07BJjdZentbFatphb5OTRfD12PsSKuTbfS6rAbXlBfk2P9QeaNA0
         WEKw==
X-Gm-Message-State: AOJu0YzEP5aLZaZDAmhD7B+2AUDSsBc+KapTSFR3XPzHbH6DlRRYKq2m
	4KW8maCGUNEFMaR+f3oykb8cSeJqFyhHGdkJjR1otG2TSor1fL+SWTpOfaS6LE1GsVUZemEvyjL
	JjFfTpWp9ah/QQIpp1jpx51HHkdvKbqBqx4AKmDcdzg6Petjht1g6omLHY1spl66Sm3RT
X-Gm-Gg: ASbGncvl/sN4TM7m1dp3XsenUZ6xI0/JnDffa19vnDsIuCOHuxYOj5lgTEFIhNH2K0e
	cjdNqkuGhk4tLRHFLwTtNJsEzzFxTLPyPrWhAipPV4vXCqClP9EPlW4+OqM8IprOmah2rl4GUjn
	ryE5lafVD7vEM1r5NmY3h4UNoXdPqbDwM1oxxViqKyN7QD/8FHcTaZP3gzILGiQnAgIQdPM68+3
	co3IMNSKfRF4jXrYS8z0nkrpOLyoKaEGrpZhEp0VwqQiHZrdcVEQN2RBE26/QHTyjcW0rH5hqjB
	lZ16l55z8b+bW7V0L02lxlg6X8us9y0KLUI4cB8=
X-Received: by 2002:a05:600c:3543:b0:46e:442c:f5e1 with SMTP id 5b1f17b1804b1-46e442d0118mr96911255e9.35.1759219404485;
        Tue, 30 Sep 2025 01:03:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfvXy6HAcvTq1desPXwRub1rGji41YrD+Kn8FuJbTL1R4jV0v0vqCLA31ybN4QOA2R1us8ug==
X-Received: by 2002:a05:600c:3543:b0:46e:442c:f5e1 with SMTP id 5b1f17b1804b1-46e442d0118mr96910995e9.35.1759219404042;
        Tue, 30 Sep 2025 01:03:24 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5873f2efsm41536675e9.4.2025.09.30.01.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:03:23 -0700 (PDT)
Date: Tue, 30 Sep 2025 10:03:22 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: virtio-comment@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
	Cornelia Huck <cornelia.huck@redhat.com>,
	Bill Mills <bill.mills@linaro.org>
Subject: Re: Use of LaTeX for the specification
Message-ID: <aNuOyv78T6TaXg6B@fedora>
References: <87ms6dl3sh.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87ms6dl3sh.fsf@draig.linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C9RHNsau0EpRbP0Ly8rrfLEWkBFe1dX48g1ZqvfgreY_1759219404
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
> 
> I don't doubt that is a powerful typesetting system but its arcane
> syntax is a bit of a barrier to entry especially for casual
> contributors. With the recent breakage I wonder if I'm the canary in the
> coal mine and this will potentially be a problem for everyone else once
> their TeX setups upgrade.
> 
> I'd like to augment the repo with some GitHub actions so we can keep an
> upto date rendered draft available as well as some lint checks so we can

I think that is a great idea. I wonder if we can do it in the current
Github repo. Do you mean to automatically generate `.pdf` from HEAD for
example?

Matias


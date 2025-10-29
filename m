Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237062F617A
	for <virtio-comment@lists.linux.dev>; Wed, 29 Oct 2025 17:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761760162; cv=none; b=EqE3ee+NT050OmmwFN52tF0rc4xvsefbZIMMuiGwtFXTWXQG6jd/l5L02e8e5O+dgKHJlO4UjfKZLDYvZjQ5EwNBuUfMWjFuZTnFsu5rAv3neb/g22mKr/fxSk8M7GMZYOmy3cboFJ9udLxlId3sNt87ToaiZMqXHYkWjJZz0Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761760162; c=relaxed/simple;
	bh=i5Z18q04BrqQhtkYSscS2dTWHdiP5pn2+4VNUriiwFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=FXchGe8WpR8eTyNwaDp3I7LtQN67FpFqZ648VtSqlgTL+Mb52ZBGtQa385ASzFF5ERlyPbNuany90+XDV/j84vHEeDI9VFa/BdWgXH1FXK+JXZFDGkximYPewHKhRbh3SYjqpSNxnPAteIPGYu7DLYAUsXTBpX9lUVfC7FKber0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KEd5Ezck; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KEd5Ezck"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761760159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHbc3sJdx9FRv4qQjbbtsNpJUqGoZeyEeiUjtjHe9Go=;
	b=KEd5EzckiXAI2XPu82nrt9JKxShYnUZDrdY1EFg33woBfpR4RQLQjpfPEI4m/NSDYMXjKj
	d2NZFTjB7HaTRgfCP/cH96M7LX+HzTVUzW8Y/TI+d4zcGFhCnyQxFmACcITSmtHWSIT3Ep
	3XAgq8gsUZA8teMwJSaaVHs2S4i6wRU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455--JIsnSqaMxGixC-Q7E2JQQ-1; Wed, 29 Oct 2025 13:49:07 -0400
X-MC-Unique: -JIsnSqaMxGixC-Q7E2JQQ-1
X-Mimecast-MFC-AGG-ID: -JIsnSqaMxGixC-Q7E2JQQ_1761760146
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-429a7f1ed1bso53442f8f.1
        for <virtio-comment@lists.linux.dev>; Wed, 29 Oct 2025 10:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761760146; x=1762364946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHbc3sJdx9FRv4qQjbbtsNpJUqGoZeyEeiUjtjHe9Go=;
        b=G+7BdH1NZvoVhCxVMipDUizB5idfIkwoPujBy5yrzgDIdppIA15B9aGbxb5+aRo3sj
         kIwIb47fqcvCymKxJ5kzRe3SMans9Y6Qv4lG2X9axtwoxEc6Y3gtS0gPvs71tQdcFuyS
         JCjssd6R3doPObutLQvhPxENPG+z8cMhpZb19cMrsV5Ghss6z5ePYh0fUSycCHqhg8LD
         LSnx7YYyh+cbuFaoYl/LbV9tkSwWR4i3y7D7x0cSdDlo0AqDMoKy3yX/qCpM1Z2/2ELv
         6yQt9u6fx3K+xKeDoaFCCWVAQyy9xOtqaRXxU12yCTtgs18B32XZ25ybgWjFBH0ahb2N
         x4LA==
X-Gm-Message-State: AOJu0YwNeRUhkGXWB/9dj+0ucQH2fBGReUSgH6t1LK2D8kx8Ck32UaWM
	mUi2OhRJONRJw3WtTH83J03ZGcJ4yLVoQaiJKO4zcD8gv0lkExw3SzJlbGe+Jdf2oZSMzzwa11L
	rAIiHV6Nz4StBhHiEM7DIDeW5MOLD5/G9YgmktGUyAh231SEdFOgttgq89aOHUZyAlcf4
X-Gm-Gg: ASbGncslIyJKPZmbBcsWw1HDYbHclDPl3ptC4KwNYuhyzH+e4Fce+4mbbLG0b/gnOgb
	4dADZ5YQkctF938zOVUAAiJa9ZG76zE6znxSAFUs/P+qSXX0PB2Wjf43jvtegS7OyMWSlBZbF2E
	mrW0iEjDtULnN703uL5ACb40gyvnKWrmI9qWMt+D9Juvb7uVT+NmoBQCviDCP0s/nuXNCSj+PcK
	uBfK/aVyftEbAw1co34ucbhRQF40AYDt0qSNeXBCzuRmkxfME8MpZPcQs7VnTa5YcRSzSKmP2yj
	mPrka6vgR9vStaRYXsxQD3uyX8f7up9j6tUkvPs1jY02UO1IbnVtV+Jct6J+FRw2ICr6
X-Received: by 2002:a05:6000:4382:b0:425:8559:5d17 with SMTP id ffacd0b85a97d-429aefb9a30mr2508255f8f.30.1761760146450;
        Wed, 29 Oct 2025 10:49:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEi0Qu2+JOspUDYI3Qt9QWM5Cs7M3DRIqkRWLIUple6oVmPLgSRQQ4h0lrFBA4JaFY04jc2pg==
X-Received: by 2002:a05:6000:4382:b0:425:8559:5d17 with SMTP id ffacd0b85a97d-429aefb9a30mr2508241f8f.30.1761760146063;
        Wed, 29 Oct 2025 10:49:06 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b79cbsm27571791f8f.4.2025.10.29.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 10:49:05 -0700 (PDT)
Date: Wed, 29 Oct 2025 18:49:04 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev, quic_tsoni@quicinc.com,
	quic_svaddagi@quicinc.com,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH] content: Reserve ID 50 for video encoder/decoder device
Message-ID: <aQJTkIVdGEaLJTWu@fedora>
References: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20251027203356.3301-1-alexander.gordeev@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: b_QTWTxFoVgTqq-h_WmNhbskeoLsIK7filgD2kjMcZQ_1761760146
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 27, 2025 at 09:33:56PM +0100, Alexander Gordeev wrote:
> Virtio video encoder/decoder device provides a stateful API for video
> encoding and decoding.
> 
> IDs 30 and 31 are already reserved for devices providing only one of
> the two functions. There are use-cases for a device providing both
> functions, so a new ID is reserved after a discussion on the ML ([1]).
> 
> [1] https://lore.kernel.org/virtio-comment/20241223055543-mutt-send-email-mst@kernel.org/
> 
> Signed-off-by: Alexander Gordeev <alexander.gordeev@oss.qualcomm.com>
> ---

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com


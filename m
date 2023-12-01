Return-Path: <virtio-comment-return-8714-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010F5C4167B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 08:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 494B02B027
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 08:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 295EC98687B
	for <virtio-comment@archiver.kernel.org>; Fri,  1 Dec 2023 08:32:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0CFEC98669A; Fri,  1 Dec 2023 08:32:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F283698669D
	for <virtio-comment@lists.oasis-open.org>; Fri,  1 Dec 2023 08:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701419537; x=1702024337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTqEfMQTZIxs7Qz3kxGPASf0Nm70Xk6dJ4pIbl8j3nk=;
        b=pWlMgtJkHrz6lnf2SmqJU33kTOrOJ3hKOYkp6eC6JyB1RTf9xpwarPfsU0z4nW1V8N
         kJF1bnQuUsFcnlXcwh1kQKlPL8g3igJhAislZfxspyc6/3s6I0ZS1AekDKaPN7CEE+gV
         UtnDn59IOGQLgzFNJjtiKHcIx85uvtz+ttP4q+Hp55uHVp/baS/lveRIew753KPUMUG/
         N4oi1TKltZ8n1g8klmpCxznkOjMWv/CkyiBspqDqCeRYUbcGJNGA9k4tuLIQm9l4GzvA
         kJmJzHhTWNWtzfKI5fRs4dE8lP+GhafeI3vIHDWQ9aZyRU38GFi05IDPNqd2G7nw5OqQ
         U6PA==
X-Gm-Message-State: AOJu0Yzd4HaIfWcVhRV5iGQySpL5YQ1fEYfMbIj0981uSo9N0t2CRlf7
	rM/Nh6z/shQW5q5rSoXTgVufog==
X-Google-Smtp-Source: AGHT+IHMaoGj3pvPoFPSqCDcpxaGICIg4JnBE0AiVp+3LhYAVCCR8PLrjH6cdRrrtDMiVMhGaPHDQQ==
X-Received: by 2002:a05:6358:93a3:b0:16b:7751:3093 with SMTP id h35-20020a05635893a300b0016b77513093mr21429226rwb.32.1701419536883;
        Fri, 01 Dec 2023 00:32:16 -0800 (PST)
Date: Fri, 1 Dec 2023 14:02:14 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Haixu Cui <quic_haixcui@quicinc.com>
Cc: virtio-dev@lists.oasis-open.org, virtio-comment@lists.oasis-open.org,
	cohuck@redhat.com, harald.mommer@opensynergy.com,
	broonie@kernel.org, qiang4.zhang@linux.intel.com,
	quic_ztu@quicinc.com
Message-ID: <20231201083214.riqdbofw2dydmwww@vireshk-i7>
References: <20231201082143.14870-1-quic_haixcui@quicinc.com>
 <20231201082143.14870-2-quic_haixcui@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201082143.14870-2-quic_haixcui@quicinc.com>
Subject: [virtio-comment] Re: [virtio-dev][PATCH V7 1/2] content: Rename SPI master to SPI
 controller

On 01-12-23, 16:21, Haixu Cui wrote:
> SPI master is an outdated term and should use SPI controller.
> 
> Signed-off-by: Haixu Cui <quic_haixcui@quicinc.com>

I already gave my reviewed by tag for this commit. Please remember to add any
such Reviewed-by tags while sending a newer version.

I think Mark also gave Reviewed-by for the other commit, you should include that
too.

> ---
>  content.tex | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/content.tex b/content.tex
> index 0a62dce..1c608eb 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -737,7 +737,7 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  44         &   ISM device \\
>  \hline
> -45         &   SPI master \\
> +45         &   SPI controller \\
>  \hline
>  \end{tabular}
>  
> -- 
> 2.17.1

-- 
viresh

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


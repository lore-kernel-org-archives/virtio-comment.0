Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA4430BB9D
	for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759156883; cv=none; b=nVWI/K0bkelznUAQOwm9IxIgkWw8THuzihy2mg7TBjQ8xE8kqu+tkdhJP7GQBQjxKgQEbC9HafdfJCl6cS6kXY0CHh+/bvwmA3Eepl+FKidegM4GgBKXxUWVkUfC2mF4CW10YjxON0JN3JpWsO9tWjXUIGK+yY9gvqzzkgeM0H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759156883; c=relaxed/simple;
	bh=mTu8TDxpzTYzAuvgciM4ekePXUBfYtewKpUD0d8+3nM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XXgzQoFs6H5NWYSmy/giWo+ZIjVQGC1tAC1ntJ2AQImiZS82nvOVTtztFs/P4pUZ9jUnVcU7jjGJViaw8N0ZXL23o+e4hnUJ1D6qxDJZkoksuB6xTVQ+USfj+SsdOdSqfLtdgyy//+B7NHPXg40+jxwF+sTMsuUry+my6+KEY4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FnrPSrZI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FnrPSrZI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so36063545e9.1
        for <virtio-comment@lists.linux.dev>; Mon, 29 Sep 2025 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759156880; x=1759761680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0JYXf2da26YWI7HPwZr91iF0tTrBojjq/uwZxORjqZ4=;
        b=FnrPSrZI+xPvd72w8H3hraA/0c/RHZAObjCc2ChRz1cTBMmT2S42dNriuDahLfulj9
         WqbjIXMPuBvvY/S2GyHBl7ejP3uDJrDebUkTNQkx+kZy0toFm9wP6EqzdGR083SDouTy
         jCgINs8DT1TBxJYU0/Ai89TWVjdGTdFh9R717wK18B8BHJhfIaeeapBD1shGYM56Iw5o
         EXgIiwmFkByzYWWJ+piuXeWt+OD4VLVupL75REt2FHcES/mQuYij0vAS7Bz5xwI1LPJg
         n2+ISTf792SGH4bTbcdKmJQerqyi5Qe4UgdQixrz9ZKnKpUcK9NcWcPk6LIcIdEG5dcQ
         7pVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759156880; x=1759761680;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0JYXf2da26YWI7HPwZr91iF0tTrBojjq/uwZxORjqZ4=;
        b=NGyifcdIdvo0v5ylKJxL51KP+UcDBLxtmEc9+II8AablqlaSzcIUiKXRpSVzkWinOQ
         ppD7BpQJ1TryTpCA00Vk6JIsPnKsp1PHrB4U3LnIqF4pHBN7mkdgzmLymSullK/mBwZJ
         HKlQ/QG+D+qf6bnLR8f207/x93ZCIn7TkbIYjksJByZKZh3+jSYM+G+aLMtfvgvMOwvi
         Gi5bm2xEUwCxsXmcdithhbdnambekfZzqr3sk9dLig8DpeTSs6na9i/dycEKjDHQI6LG
         Ek4JMMhpakt3O7BxBexG/TjygHliDr2b1cb8RRrsSxvmlvIaVyZD+NFVv0N8lTRhjjc7
         lxAw==
X-Gm-Message-State: AOJu0YwxRuCuEfOcztcz/3cCl3WsUqrVQKvm7u5mH/lcEcL+ag1MSBjT
	p/WOX9jdaCaepQTEh2/R9n2vCFeeHxD/Y4trZMk7nH/PD8zjGuyIoDb+JZlrCD9xAgc=
X-Gm-Gg: ASbGncu20ivjHDCRF4Iv/SDSpuxnPA9Ia7+qIikDD+b7itihiNV8wFhFzbtkR8ecc09
	bQXV26TlCBI8U9ipq4DhfIQjttEx6tsJmnRjj7Pqs1H67cUOxEPBNQqlU4AFatLCC725dssVdy1
	L5qIvIjigmldlWxmp6h23x2GaLuTeiJkbsWnb/TnYbx5p9rvQnIfatzLkfIYfKUOvtPGmK/Fnf6
	edy3via5rvhvwzUhzDC8V/nfooUjELHWNIlpqrCMDK5wx8fqsvKng5NevEqd3okK0U/425qP0wt
	kgnt/bT/1mhuWADJMWjpGtlhqnBKlqbU5g8LtiD4nWokiz8gyAekeKcbfHoF8VnPfVrqMeXP/mU
	eCXA31ip9gzn3DFgK4pjp7vKKNFaYooXIOA==
X-Google-Smtp-Source: AGHT+IG46UUZDyiqPG8W3ZSnjLEgtxtfY9a2lDks7WCYS/993HXva8GiaA2USkzRrt0NJz8UzC2O9g==
X-Received: by 2002:a05:600c:3e0b:b0:46e:3e63:9a8e with SMTP id 5b1f17b1804b1-46e3e639e5dmr123607435e9.26.1759156879871;
        Mon, 29 Sep 2025 07:41:19 -0700 (PDT)
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm230115655e9.0.2025.09.29.07.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:41:19 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 62A3E5F83A;
	Mon, 29 Sep 2025 15:41:18 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: virtio-comment@lists.linux.dev
Cc: Michael S. Tsirkin <mst@redhat.com>, Cornelia Huck
 <cornelia.huck@redhat.com>, Bill Mills <bill.mills@linaro.org>
Subject: Use of LaTeX for the specification
User-Agent: mu4e 1.12.14-dev1; emacs 30.1
Date: Mon, 29 Sep 2025 15:41:18 +0100
Message-ID: <87ms6dl3sh.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

I recently updated my distro to Trixie and found that HTML generation is
broken. As far as I can tell this comes down to the use of \cline as
shown in this minimal example:

  \documentclass{article}
  \usepackage{hhline}
  \begin{document}
  \begin{tabular}{ |l||l|l| }
  \hline
  Bits & Device Specific & Purpose \\
  \cline{1-2}
  Read / Write & Device Specific & \\
  \cline{1-2}
  Purpose & Device Specific & \\
  \hline
  \end{tabular}
  \end{document}

which results in TeX ending early:

  ! Undefined control sequence.
  \f:HBorder ...border-top:1px solid \#\hline:color=20
                                                    ;"></td>
  l.8 R
       ead / Write & Device Specific & \\
  ?=20
  ! Emergency stop.

I'm liaising with Debian and the TexLive authors to try and figure out
whats going on. However it does raise a bigger question for the
specification - why do we use LaTeX?

I don't doubt that is a powerful typesetting system but its arcane
syntax is a bit of a barrier to entry especially for casual
contributors. With the recent breakage I wonder if I'm the canary in the
coal mine and this will potentially be a problem for everyone else once
their TeX setups upgrade.

I'd like to augment the repo with some GitHub actions so we can keep an
upto date rendered draft available as well as some lint checks so we can
avoid introducing dodgy markup. But firstly I want to ask is LaTeX the
right source format for the spec going forward? Is this something
mandated by OASIS or just an accident of history?

Thanks,

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

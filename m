Return-Path: virtio-comment-return-1872-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 1821E986523
	for <virtio-comment@lists.oasis-open.org>; Wed,  2 Jun 2021 06:45:01 +0000 (UTC)
Date: Wed, 2 Jun 2021 12:14:57 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210602064456.m7zhfhcekttxkair@vireshk-i7>
References: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
In-Reply-To: <fe497091797c31f8b59a989fbd34b93fd07adce4.1622615811.git.viresh.kumar@linaro.org>
Subject: [virtio-comment] Re: [PATCH] Reserve device id for GPIO device
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: virtio-comment@lists.oasis-open.org
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Bill Mills <bill.mills@linaro.org>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, "Enrico Weigelt, metux IT consult" <info@metux.net>
List-ID: <virtio-comment.lists.oasis-open.org>

On 02-06-21, 12:12, Viresh Kumar wrote:
> Use device ID 41
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index b9934b4fa05c..d9913d056317 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -2876,6 +2876,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  40         &   Bluetooth device \\
>  \hline
> +41         &   GPIO device \\
> +\hline
>  \end{tabular}
>  
>  Some of the devices above are unspecified by this document,

Opened issue for the same here:

https://github.com/oasis-tcs/virtio-spec/issues/109

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


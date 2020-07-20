Return-Path: virtio-comment-return-1354-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 96311985A2D
	for <virtio-comment@lists.oasis-open.org>; Mon, 20 Jul 2020 17:10:43 +0000 (UTC)
Date: Mon, 20 Jul 2020 13:10:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20200720130948-mutt-send-email-mst@kernel.org>
References: <20200527090707.75747-1-epetre@amazon.com>
 <dbca5c9e-8809-f121-1e08-441b4800ab09@amazon.com>
MIME-Version: 1.0
In-Reply-To: <dbca5c9e-8809-f121-1e08-441b4800ab09@amazon.com>
Subject: Re: [virtio-comment] Re: [PATCH v2] content: Reserve virtio-nsm
 device ID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Eftime, Petre" <epetre@amazon.com>
Cc: virtio-comment@lists.oasis-open.org, graf@amazon.de
List-ID: <virtio-comment.lists.oasis-open.org>

On Wed, Jun 10, 2020 at 04:17:25PM +0300, Eftime, Petre wrote:
> On 2020-05-27 12:07, Petre Eftime wrote:
> 
>     The NitroSecureModule is a device with a very stripped down
>     Trusted Platform Module functionality, which is used in the
>     context of a Nitro Enclave (see https://lkml.org/lkml/2020/4/21/1020)
>     to provide boot time measurement and attestation.
> 
>     Since this device provides some critical cryptographic operations,
>     there are a series of operations which are required to have guarantees
>     of atomicity, ordering and consistency: operations fully succeed or fully
>     fail, including when some external events might interfere in the
>     process: live migration, crashes, etc; any failure in the critical
>     section requires termination of the enclave it is attached to, so
>     the device needs to be as resilient as possible, simplicity is
>     strongly desired.
> 
>     To account for that, the device and driver are made to have very few
>     error cases in the critical path and the operations themselves can be
>     rolled back and retried if events happen outside the critical
>     area, while processing a request. The driver itself can be made very
>     simple and thus is easily portable.
> 
>     Since the requests can be handled directly in the virtio queue, serving
>     most requests requires no additional buffering or memory allocations
>     on the host side.
> 
>     Signed-off-by: Petre Eftime <epetre@amazon.com>
>     ---
>      content.tex | 2 ++
>      1 file changed, 2 insertions(+)
> 
>     diff --git a/content.tex b/content.tex
>     index 91735e3..66c8f2b 100644
>     --- a/content.tex
>     +++ b/content.tex
>     @@ -2801,6 +2801,8 @@ \chapter{Device Types}\label{sec:Device Types}
>      \hline
>      31         &   Video decoder device \\
>      \hline
>     +33         &   NitroSecureModule \\
>     +\hline
>      \end{tabular}
> 
>      Some of the devices above are unspecified by this document,
> 
> Hi all,
> 
> I've opened a corresponding issue on Github.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/81
> 
> Thank you,
> Petre Eftime


Looks like no one minds. Do you want the TC to vote on this?

> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar
> Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in
> Romania. Registration number J22/2621/2005.
> 


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


Return-Path: virtio-comment-return-1357-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80D56985CAF
	for <virtio-comment@lists.oasis-open.org>; Tue, 21 Jul 2020 11:23:48 +0000 (UTC)
References: <20200527090707.75747-1-epetre@amazon.com>
 <dbca5c9e-8809-f121-1e08-441b4800ab09@amazon.com>
 <20200720130948-mutt-send-email-mst@kernel.org>
From: "Eftime, Petre" <epetre@amazon.com>
Message-ID: <b55091ce-686f-02ac-42d0-b794a95e1c63@amazon.com>
Date: Tue, 21 Jul 2020 14:23:33 +0300
MIME-Version: 1.0
In-Reply-To: <20200720130948-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Subject: Re: [virtio-comment] Re: [PATCH v2] content: Reserve virtio-nsm device ID
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, graf@amazon.de
List-ID: <virtio-comment.lists.oasis-open.org>

On 2020-07-20 20:10, Michael S. Tsirkin wrote:
> On Wed, Jun 10, 2020 at 04:17:25PM +0300, Eftime, Petre wrote:
>> On 2020-05-27 12:07, Petre Eftime wrote:
>>
>>      The NitroSecureModule is a device with a very stripped down
>>      Trusted Platform Module functionality, which is used in the
>>      context of a Nitro Enclave (see https://lkml.org/lkml/2020/4/21/102=
0)
>>      to provide boot time measurement and attestation.
>>
>>      Since this device provides some critical cryptographic operations,
>>      there are a series of operations which are required to have guarant=
ees
>>      of atomicity, ordering and consistency: operations fully succeed or=
 fully
>>      fail, including when some external events might interfere in the
>>      process: live migration, crashes, etc; any failure in the critical
>>      section requires termination of the enclave it is attached to, so
>>      the device needs to be as resilient as possible, simplicity is
>>      strongly desired.
>>
>>      To account for that, the device and driver are made to have very fe=
w
>>      error cases in the critical path and the operations themselves can =
be
>>      rolled back and retried if events happen outside the critical
>>      area, while processing a request. The driver itself can be made ver=
y
>>      simple and thus is easily portable.
>>
>>      Since the requests can be handled directly in the virtio queue, ser=
ving
>>      most requests requires no additional buffering or memory allocation=
s
>>      on the host side.
>>
>>      Signed-off-by: Petre Eftime <epetre@amazon.com>
>>      ---
>>       content.tex | 2 ++
>>       1 file changed, 2 insertions(+)
>>
>>      diff --git a/content.tex b/content.tex
>>      index 91735e3..66c8f2b 100644
>>      --- a/content.tex
>>      +++ b/content.tex
>>      @@ -2801,6 +2801,8 @@ \chapter{Device Types}\label{sec:Device Types=
}
>>       \hline
>>       31         &   Video decoder device \\
>>       \hline
>>      +33         &   NitroSecureModule \\
>>      +\hline
>>       \end{tabular}
>>
>>       Some of the devices above are unspecified by this document,
>>
>> Hi all,
>>
>> I've opened a corresponding issue on Github.
>>
>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/81
>>
>> Thank you,
>> Petre Eftime
>
> Looks like no one minds. Do you want the TC to vote on this?
>
Yes, would help us get started towards upstreaming the Linux driver for=20
this.

Thank you,
Petre Eftime





Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar=
 Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in R=
omania. Registration number J22/2621/2005.


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=
=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lis=
ts=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/


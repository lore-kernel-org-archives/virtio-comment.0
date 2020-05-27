Return-Path: virtio-comment-return-1302-cohuck=redhat.com@lists.oasis-open.org
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0753C985FB4
	for <virtio-comment@lists.oasis-open.org>; Wed, 27 May 2020 09:12:51 +0000 (UTC)
References: <20200521104942.5440-1-epetre@amazon.com>
 <20200526090546.GB766304@stefanha-x1.localdomain>
From: "Eftime, Petre" <epetre@amazon.com>
Message-ID: <67350891-ce9c-27f4-dca3-ca6a30be97db@amazon.com>
Date: Wed, 27 May 2020 12:12:30 +0300
MIME-Version: 1.0
In-Reply-To: <20200526090546.GB766304@stefanha-x1.localdomain>
Content-Language: en-US
Subject: Re: [virtio-comment] [PATCH 1/1] content: Reserve virtio-nsm device ID
Content-Type: text/plain; charset="windows-1252"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtio-comment@lists.oasis-open.org, graf@amazon.com
List-ID: <virtio-comment.lists.oasis-open.org>

On 2020-05-26 12:05, Stefan Hajnoczi wrote:
> On Thu, May 21, 2020 at 01:49:42PM +0300, Petre Eftime wrote:
>> The NitroSecureModule is a device with a very stripped down
>> Trusted Platform Module functionality, which is used in the
>> context of a Nitro Enclave (see https://lkml.org/lkml/2020/4/21/1020)
>> to provide boot time measurement and attestation.
>>
>> Since this device provides some critical cryptographic operations,
>> there are a series of operations which are required to have guarantees
>> of atomicity, ordering and consistency: operations fully succeed or full=
y
>> fail, including when some external events might interfere in the
>> process: live migration, crashes, etc; any failure in the critical
>> section requires termination of the enclave it is attached to, so
>> the device needs to be as resilient as possible, simplicity is
>> strongly desired.
>>
>> To account for that, the device and driver are made to have very few
>> error cases in the critical path and the operations themselves can be
>> rolled back and retried if events happen outside the critical
>> area, while processing a request. The driver itself can be made very
>> simple and thus is easily portable.
>>
>> Since the requests can be handled directly in the virtio queue, serving
>> most requests requires no additional buffering or memory allocations
>> on the host side.
>>
>> Signed-off-by: Petre Eftime <epetre@amazon.com>
>> ---
>>   content.tex | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/content.tex b/content.tex
>> index 91735e3..6eee371 100644
>> --- a/content.tex
>> +++ b/content.tex
>> @@ -2801,6 +2801,8 @@ \chapter{Device Types}\label{sec:Device Types}
>>   \hline
>>   31         &   Video decoder device \\
>>   \hline
>> +0xec2000   &   NitroSecureModule \\
> The PCI and CCW transports represent VIRTIO device type IDs with 16-bit
> fields. Is there a reason why the NitroSecureModule device should only
> work with VIRTIO transports that support >16-bit device type IDs?
>
> If not, then please pick the next low-numbered ID instead.
>
> Stefan

I saw that there's already a vote open for device ID 32, so I went with=20
33 instead. I was under the impression that virtio device IDs are always=20
32bit, based on the data types used in Linux to express them.

Best,

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


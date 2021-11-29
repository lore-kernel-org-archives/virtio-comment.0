Return-Path: <virtio-return-3617-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <YaSokleLquXepxI4@stefanha-x1.localdomain>
References: <20211126171233.16083-1-pasic@linux.ibm.com>
 <YaSokleLquXepxI4@stefanha-x1.localdomain>
Date: Mon, 29 Nov 2021 13:23:09 +0100
Message-ID: <87h7bvi21e.fsf@redhat.com>
MIME-Version: 1.0
Subject: [virtio] Re: [virtio-comment] [PATCH 1/1] split-ring: clarify the field len
 in the used ring
Content-Type: text/plain
To: Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Nov 29 2021, Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Fri, Nov 26, 2021 at 06:12:33PM +0100, Halil Pasic wrote:
>> The current descriptor is misleading: "the descriptor chain which was
>
> s/current descriptor/current description/?

Indeed; easy mistake to make when you look at descriptor chains :)

>
>> used" generally includes both the descriptors that map the device read
>> only, and descriptors that  map the device write only portions of the
>> buffer described by the descriptor chain. The argument that "used" means
>> "written to" does not stand because one has to "use" the descriptor
>> chain even when the whole buffer is device read only.
>> 
>> One can argue, that the most straightforward way to interpret the phrase
>> "total length of that descriptor chain" (without context) like the
>> length of the  list is usually defined: i.e. like the number of
>> descriptors that constitute the chain. This is clearly not what we want
>> here. Another intuitive way to interpret "total length of that
>> descriptor chain" is size of the buffer mapped by the descriptor chain.
>> This is not what we want either. In fact such wrongful interpretations
>> have caused bugs in the wild.
>> 
>> On the other hand, the text below the listing that gets modified here
>> clearly describes the semantics of \field{len}. So let us replace
>> the ambiguous explanation in the listing, with a hopefully non-ambiguous
>> one.
>> 
>> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
>> ---
>>  split-ring.tex | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/split-ring.tex b/split-ring.tex
>> index bfef62d..68dca07 100644
>> --- a/split-ring.tex
>> +++ b/split-ring.tex
>> @@ -402,7 +402,10 @@ \subsection{The Virtqueue Used Ring}\label{sec:Basic Facilities of a Virtio Devi
>>  struct virtq_used_elem {
>>          /* Index of start of used descriptor chain. */
>>          le32 id;
>> -        /* Total length of the descriptor chain which was used (written to) */
>> +        /*
>> +	 * The number of bytes written into the device writable portion of
>> +	 * the buffer described by the descriptor chain.
>> +	 */
>
> Spaces vs tabs. It looks like 8 spaces should be used here.

Nod.

>
> Otherwise:
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

I can push that with the fixup as an editorial update, if everyone
agrees. (I don't think we need a vote, as the semantics of the field are
already described below.)


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 


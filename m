Return-Path: <david@redhat.com>
Subject: Re: [virtio-comment] [PATCH v1 2/2] virtio-mem: describe interaction
 with memory properties
References: <20210812133150.36146-1-david@redhat.com>
 <20210812133150.36146-3-david@redhat.com> <87k0kktpfs.fsf@redhat.com>
 <f4bf611f-c35f-8b22-5382-5a8ea87bfd31@redhat.com> <878s10tlm2.fsf@redhat.com>
 <e186d1a9-45b0-d34f-2f04-bbd8492b9698@redhat.com> <875yw4td7d.fsf@redhat.com>
From: David Hildenbrand <david@redhat.com>
Message-ID: <5a7fec34-5dba-da84-723b-3cb4769e6404@redhat.com>
Date: Tue, 17 Aug 2021 15:27:46 +0200
MIME-Version: 1.0
In-Reply-To: <875yw4td7d.fsf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Cornelia Huck <cohuck@redhat.com>, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On 17.08.21 15:25, Cornelia Huck wrote:
> On Tue, Aug 17 2021, David Hildenbrand <david@redhat.com> wrote:
> 
>> On 17.08.21 12:24, Cornelia Huck wrote:
>>> On Tue, Aug 17 2021, David Hildenbrand <david@redhat.com> wrote:
>>>
>>>>>> -The driver MUST NOT request to unplug memory blocks while the memory is
>>>>>> -still in use.
>>>>>> +The driver MUST NOT request unplug of memory blocks while corresponding memory
>>>>>> +or memory properties are still in use.
>>>>>>     
>>>>>>     The driver SHOULD initialize memory blocks after plugging them, the content
>>>>>>     is undefined.
>>>>>>     
>>>>>> +The driver SHOULD initialize memory properties of memory blocks after plugging
>>>>>> +them if it cannot deal with either the default settings or the previous
>>>>>> +setting.
>>>>>
>>>>> This would imply that any memory properties need to allow modification
>>>>> by the driver, right? It's clear what you want to introduce this for,
>>>>> but do we need to tighten the definition of what kind of memory
>>>>> properties we are talking about?
>>>>
>>>> Right, we actually want to have:
>>>>
>>>> "The device MUST allow to read and write memory and querying and
>>>> modifying memory properties of plugged memory blocks."
>>>>
>>>
>>> "...must allow the driver to..."
>>
>> Right, although we used something like "the device MUST allow the CPU
>> to" ... and "The device MAY allow to read from unplugged memory blocks
>> inside the region via DMA."
>>
>> I guess if we want to cleanup, that would be e.g., "the device MUST
>> allow the driver .. via the CPU".
> 
> Hm, maybe. Need to think about that.

Something like this:


commit 2afa0c5e00889e2030189d843bc6df7bf2ee10c7 (HEAD)
Author: David Hildenbrand <david@redhat.com>
Date:   Tue Aug 17 14:24:18 2021 +0200

     virtio-mem: simplify statements that express unexpected behavior on memory access
     
     Some statements express that the device MAY allow access to memory insided
     unplugged memory blocks, although it's really just unexpected behavior and
     conforming drivers MUST NOT perform such access.
     
     Clarify that, and move the special CPU vs. DMA handling for some
     unplugged memory blocks to the driver section instead.
     
     While at it, start rephrasing our statements to clarify and prepare for
     further changes.
     
     Signed-off-by: David Hildenbrand <david@redhat.com>

diff --git a/virtio-mem.tex b/virtio-mem.tex
index 62a1d02..f0c5970 100644
--- a/virtio-mem.tex
+++ b/virtio-mem.tex
@@ -220,8 +220,11 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
  The driver MUST NOT read from unplugged memory blocks outside
  \field{usable_region_size}.
  
-The driver SHOULD NOT read from unplugged memory blocks inside
-\field{usable_region_size}.
+The driver MUST NOT read memory of unplugged memory blocks inside
+\field{usable_region_size} via DMA.
+
+The driver SHOULD NOT read memory of unplugged memory blocks inside
+\field{usable_region_size} via the CPU.
  
  The driver MUST NOT request to unplug memory blocks while the memory is
  still in use.
@@ -246,18 +249,10 @@ \subsection{Device Operation}\label{sec:Device Types / Memory Device / Device Op
  
  The device MUST NOT change the content of plugged memory blocks.
  
-The device MUST allow the CPU to read from unplugged memory blocks inside
-the usable device-managed region. \footnote{To allow for simplified dumping of
-memory. The CPU is expected to copy such memory to another location before
-starting DMA.}
-
-The device MAY allow to read from unplugged memory blocks inside the
-usable device-managed region via DMA.
-
-The device MAY allow to read from unplugged memory blocks outside
-the usable device-managed region.
-
-The device MAY allow to write to unplugged memory blocks.
+The device MUST allow the driver to read memory of unplugged memory blocks
+inside \field{usable_region_size} via the CPU. \footnote{To allow for simplified
+dumping of memory. The CPU is expected to copy such memory to another location
+before starting DMA.}
  
  The device MAY change the state of memory blocks during system resets.
  



-- 
Thanks,

David / dhildenb


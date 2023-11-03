Return-Path: <virtio-comment-return-8164-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB663C4332F
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:47:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 23CB92A89C
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:47:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0411E986C4C
	for <virtio-comment@archiver.kernel.org>; Fri,  3 Nov 2023 15:47:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id D44B0986C3F; Fri,  3 Nov 2023 15:47:40 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id C3DF3986C40
	for <virtio-comment@lists.oasis-open.org>; Fri,  3 Nov 2023 15:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxQeTAUuhUw+bE1YpXzPpTtL13qKH0Nu6uDUZc8NfyvBB2i+GMaeZjjUsBKalzlIploZqaGRStNxXH3cAgCbbo53pHWQ/aQbAbqx7VwL2VGiEJAvjPfDRn088cNaNJxlN7+3XCUZQXhcGpMpvtO9grKuTLBnWZmZRu58zY7t9yiLa1Ts6sBQg8MDR567fpk8XNu3eL4iEdZKjhoQQL1xuugktKhVUoPQWPhOg4iq3gybJynU76Bg8DBB1vyJpfLVpOpsJfLqN6fjctQV4ks06SKWa5WhW6pw1DbwVwPFfTwmt9veh3dFxmRbtnyZrvLWkEl+nb9VaymaXxMJYzQ10Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYa27oVlqhJhFDAL+RVievb9teeAervfui/om5H3Aqc=;
 b=VGUt0nHYaNReUW4Olniz+Pc8qOnzu9SEcAtaqPo3VR1PHvqkVhbz4oE3u+gQa53Ec0oXSw9/ZHDzBOvnqzsbczBgyNUILGZOfwg1Vjkb0qSNR39lj32ptO0+l532zO5jeN/KY1+ZwpJxaZDa+5lWoDSc8p2tNpiVNHEOceMUnYQ+taVS/vKJOnGXynd/7fZ801MIpgcO2B5LNwoctUvcpHUKe0sH+yWQJsA/DuonuNgWM1CqQ3xPe03h3OazRwr77q3UhmRYJ1IB53/qOpbWlGnvUIGyIlVMfRjXWHTWjYYVez4yiLRKy06bBzpGBPQ+8urxsTEEDlfhF/z5f3go+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
From: Parav Pandit <parav@nvidia.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin"
	<mst@redhat.com>
CC: "jasowang@redhat.com" <jasowang@redhat.com>, "eperezma@redhat.com"
	<eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Thread-Topic: [PATCH V2 6/6] virtio-pci: implement dirty page tracking
Thread-Index: AQHaDkFr7w3tkrCqqkSwyxm5dwAptLBoapSAgAABpXCAAETRAIAACO2Q
Date: Fri, 3 Nov 2023 15:47:34 +0000
Message-ID:
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
In-Reply-To: <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB5481:EE_|IA1PR12MB7687:EE_
x-ms-office365-filtering-correlation-id: e901ec5c-718d-434d-bf0a-08dbdc8432cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 CL6WQwkaeqhDqXwYG6nul176g50vJBBY97NSju+62rC8UGfPeZ8/NMNsUc3UH7rja1vz9xtljTG8nymaWfLkDpzOIreXdXclplmpbzaTz1JetBPMI7f6fDTB0bvv5Ld7d6rMm2qLqqGjd6/r2e5o0WpE3PPbhvod9FTuXUMXqXIVrRAI9IZVaHmI5peL2F8CoJ7XIdtImb+84zKNKGvMckSyudKfd1hPtHo1SrUkf/1qdBdliTan5OzGODq9tCZ1PsDl4IDvjDiaVDq6O9ftSkP+YuzXsiWZRe1NgMEf5B3vrQikfqxlYXXrkhyLBXv9qiVdijbD/E9W98H1hBEgsQXF3ITq2w7eG/U2E1DGWbeQAKkF1ALuCAvCVI6VjO4qFlD7AHkdV5GyzRaDyEsNV622IN9XRZYUmoeAsrXoVzXeR+VzK0Xf8GQT+17dkA1GqCd/33slLyJ55bAdq3/de24VSHUT2bepAh4B9zZ/Q7hVBgWCD32oEzeT4lAu5g4iAQfNEMVzxaRV6GDkzSBE2pVGg2yu31LsGpxy/wDlSiYw4OeKx93yKxWKGWMS4O+U31iXTQUnk7c1W0qNFECOmALD/jFhfc0dIOhLxqT4eDZAt8J2V+JEllu7FQtYEeHqZPnWVh6T1EAmgVFOlrpN/gN8swQnicXP+UJn/2tTlgFrp//NPLvlrSJjXBzVHINpML/A3boXrbHL1g72uoQoRuGqZ1YFxGclhf/F9XDAHjI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB5481.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(366004)(376002)(396003)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(9686003)(26005)(55016003)(38100700002)(38070700009)(33656002)(86362001)(122000001)(83380400001)(2906002)(478600001)(7696005)(71200400001)(66574015)(54906003)(6506007)(53546011)(8676002)(4326008)(52536014)(66476007)(8936002)(966005)(66556008)(316002)(64756008)(66446008)(76116006)(5660300002)(41300700001)(110136005)(66946007)(14143004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZUtlTGo2M3RFaGEwR0daR2thNy9WVSsyY1pBZnpiRTZlN29MNXdrWm5JeW9l?=
 =?utf-8?B?bzA4SFp6Yk1kRmZsd1llcGtEUmp5UTlBRHNnUmdXVm40aFVtMDlBK0gvdnZ4?=
 =?utf-8?B?S2JVTERVUTBQcGkxclZxVFA5eUNZbkNuNWVzNTNNNkZSN1F6OWRBZW9lSExk?=
 =?utf-8?B?RTNJam42cmtoT2FlL1hwQWFJc3d1TllkVlUzL0FodHdCdWk4dFpWdkVZb2ZU?=
 =?utf-8?B?SFE1ajFxNXFORjI3N0JBTWwxbG1KNTUyOUM3d3Fobk5LVWh6R2VaL3VLRWxV?=
 =?utf-8?B?TGkvRlp2TkF4ZW9PNmtsOG1KQ2lxdko1N3FFMlFBSHVmUXJvQXZkYW8yOWdZ?=
 =?utf-8?B?MHMxc0pzcVFST2FQWFBRY1N3eVhCSVUwVmlERGJsSU5LMUhLL0E3dkRFNTZJ?=
 =?utf-8?B?RmhHQ3VQcHIwZGJ2Q0xsYlB6UmFXWjRMcVZERFNkL2dtelNKMno1ZlNSc0gz?=
 =?utf-8?B?RUFqWFlycS9YbE9ERUVuVFhTd1Ntc2g4SFRtRGxJR3FGc2ZST1Mya2pIbGxo?=
 =?utf-8?B?VVFZVDV4VlE0S01sSXMreHNVc0YvVnBJdDBSMjlkYVlBbDJkcUhTcVV5OEFS?=
 =?utf-8?B?VFpicFJzT3ZUQXA5M0RwanJHTVBsWEtYaFE4ZlhCQjd6d01wNFkwZExJaC9k?=
 =?utf-8?B?Z0pLbDV1MzZCYUlna3hzcWxKRE5ZZWRocUlOYncxR2hrNU8zV0poSGFOMzlh?=
 =?utf-8?B?eFRRZEdMUS9jVVVQc2szc1JwdTFpcXlNQStMN0ErSk0zWUlrZzhqQW1sVTZW?=
 =?utf-8?B?amJNdWpwVlVFRk9uVGkwbVBXTGJOK3hxbGZYZG1mbFRyMDk4N0J6emFFK3Ix?=
 =?utf-8?B?cklOVnJNR2lhWUc1MDc0b2pMRW5XNlZKOVA4UDVCTDEycE9MTjBQY2dVbW9l?=
 =?utf-8?B?WVE0OHBxRCtIMlNwTTROUHF2c2MvLzFrT0JtNHh1aWhZeTAyN1FpQ3gvV3Nv?=
 =?utf-8?B?VTBmRDUyRURzVFh0YnVwOXBvRmEyVHJ0RDJkZDVXWTRBdUxyVHRqL0RoM2Z3?=
 =?utf-8?B?ejJHVW9yaWJLcHNQa0NGNjkyUEFRdWtIS1NkVEQ4UWtWb0k3UE1LMk0wRmha?=
 =?utf-8?B?bS9xWFRJVHY3WW9Xb3pmaTgyRG95UmFhaXFKN0QyREdSemlkR3FWbnljZjVl?=
 =?utf-8?B?dERaVUdTeks5d2UvWUFTSno1NW9RMnJHK2ZhS0hkWXR4bTJzMG00KzZrNUJr?=
 =?utf-8?B?S0xucEI2a2ZYNWJUQWJjOVpUZERwU0xuK1hUdjFqVmVKeCtWYjR3ejZSUlZ6?=
 =?utf-8?B?MzY1VFZYajBTaTEvUUtwS29mS2RRUnRPVWNvdGJwenUwdWZDTTNQY1pveVdv?=
 =?utf-8?B?KzY1RzJDQU1Ya1pzY0huQ3VPb3pkWEZQeDMvZGJYYlBGVVNSNzVlWjFZeEFH?=
 =?utf-8?B?bkFDM1lraDNreThoOGlwbkNWUDdSWDNWd2QxZ3JmSnRzMmFybm1NMEtaZS90?=
 =?utf-8?B?eDFIbmxUd0g5QUI2cVdnNHZMSEV4c2RWVlR4TFVQZE1HemlNSFM3REdSaXpv?=
 =?utf-8?B?VW5UeFBNMzdVN2xJOVQ3a01GNG1DZnAzbjI4UlpXM0ZJdExWTUxwbHY1SVZs?=
 =?utf-8?B?am5QZFJJNVNWcGF0Z2dmQkY4NHRBekllQzNybXFxOUwzOE9ZbzZrTHIwRnlH?=
 =?utf-8?B?VFV4WjczUUFKRGMxNVZLZzIwZnVmd016cjJLNjN2MDBqVUhFL1MvYVNpWTdH?=
 =?utf-8?B?ZCtVWHhBWElMVUZnMWlIUVNHZVJNQmpiK0R1WjBmVklNR1NIRDVuaDJZT2VI?=
 =?utf-8?B?alZCNFd2WE8rS05kc3daMEg5cE55TzlNTzhkaWZCbFFKMlZoYTZHT3crTVpv?=
 =?utf-8?B?YmUzQ2J6bllHcXFXZjM4dW1ORzRpbWVxSEN1dkZBNVZuRy9uazZNd0NnQlE0?=
 =?utf-8?B?Tkd3NGdwNnoyaG50dC9DYW5FR1JEdklBSTF1dTNxQ1RWSFE2TG9WWUt3WWs4?=
 =?utf-8?B?RUZETkN4cDFjckMyMk1EWDh0ekY2amhnRmY1SjZBMVRZb25YMHh0YWFWdlhr?=
 =?utf-8?B?Um13WXJ3ckZGNFlVdW1vZENCTHJBQTRmU3dyK0xlZU5jRWlzcVpKREJZNThs?=
 =?utf-8?B?WWdneTQ0aEF3M1RvK3A0RHF1d0UvOFc4K1BDT2c3TzdLbjJpTCs1VVpHSndQ?=
 =?utf-8?Q?VSU8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB5481.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e901ec5c-718d-434d-bf0a-08dbdc8432cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2023 15:47:34.8856
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bh3pWZzuWr5krZ2SA9rMfId8EkHxH4arz2f8g3qqdKpbcfsCAPUa+ePEUgUZbgnkM0cBVDJ++4DmUiQIhGTQfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7687
Subject: [virtio-comment] RE: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

DQo+IEZyb206IFpodSwgTGluZ3NoYW4gPGxpbmdzaGFuLnpodUBpbnRlbC5jb20+DQo+IFNlbnQ6
IEZyaWRheSwgTm92ZW1iZXIgMywgMjAyMyA4OjMzIFBNDQo+IA0KPiBPbiAxMS8zLzIwMjMgNzoz
NSBQTSwgUGFyYXYgUGFuZGl0IHdyb3RlOg0KPiA+PiBGcm9tOiBNaWNoYWVsIFMuIFRzaXJraW4g
PG1zdEByZWRoYXQuY29tPg0KPiA+PiBTZW50OiBGcmlkYXksIE5vdmVtYmVyIDMsIDIwMjMgNDoy
MCBQTQ0KPiA+Pg0KPiA+PiBPbiBGcmksIE5vdiAwMywgMjAyMyBhdCAwNjozNDozN1BNICswODAw
LCBaaHUgTGluZ3NoYW4gd3JvdGU6DQo+ID4+PiArXGl0ZW1bXGZpZWxke2JpdG1hcF9hZGRyfV0N
Cj4gPj4+ICsJVGhlIGRyaXZlciB1c2UgdGhpcyB0byBzZXQgdGhlIGFkZHJlc3Mgb2YgdGhlIGJp
dG1hcCB3aGljaCByZWNvcmRzDQo+ID4+PiArdGhlDQo+ID4+IGRpcnR5IHBhZ2VzDQo+ID4+PiAr
CWNhdXNlZCBieSB0aGUgZGV2aWNlLg0KPiA+Pj4gKwlFYWNoIGJpdCBpbiB0aGUgYml0bWFwIHJl
cHJlc2VudHMgb25lIG1lbW9yeSBwYWdlLCBiaXQgMCBpbiB0aGUgYml0bWFwDQo+ID4+PiArCXJl
cHJzZW50cyBwYWdlIDAgYXQgYWRkcmVzcyAwLCBiaXQgMSByZXByZXNlbnRzIHBhZ2UgMSwgYW5k
IHNvIG9uDQo+ID4+PiAraW4gYQ0KPiA+PiBsaW5lYXIgbWFubmVyLg0KPiA+Pj4gKwlXaGVuIFxm
aWVsZHtlbmFibGV9IGlzIHNldCB0byAxIGFuZCB0aGUgZGV2aWNlIHdyaXRlcyB0byBhIG1lbW9y
eSBwYWdlLA0KPiA+Pj4gKwl0aGUgZGV2aWNlIE1VU1Qgc2V0IHRoZSBjb3JyZXNwb25kaW5nIGJp
dCB0byAxIHdoaWNoIGluZGljYXRpbmcNCj4gPj4+ICt0aGUNCj4gPj4gcGFnZSBpcyBkaXJ0eS4N
Cj4gPj4+ICtcaXRlbVtcZmllbGR7Yml0bWFwX2xlbmd0aH1dDQo+ID4+PiArCVRoZSBkcml2ZXIg
dXNlIHRoaXMgdG8gc2V0IHRoZSBsZW5ndGggaW4gYnl0ZXMgb2YgdGhlIGJpdG1hcC4NCj4gPj4+
ICtcZW5ke2Rlc2NyaXB0aW9ufQ0KPiA+Pj4gKw0KPiA+Pj4gK1xkZXZpY2Vub3JtYXRpdmV7XHN1
YnN1YnNlY3Rpb259e01lbW9yeSBEaXJ0eSBQYWdlcyBUcmFja2VyDQo+ID4+PiArQ2FwYWJpbGl0
eX17VmlydGlvIFRyYW5zcG9ydCBPcHRpb25zIC8gVmlydGlvIE92ZXIgUENJIEJ1cyAvIE1lbW9y
eQ0KPiA+Pj4gK0RpcnR5IFBhZ2VzIFRyYWNrZXIgQ2FwYWJpbGl0eX0NCj4gPj4+ICsNCj4gPj4+
ICtUaGUgZGV2aWNlIE1VU1QgTk9UIHNldCBhbnkgYml0cyBiZXlvbmQgYml0bWFwX2xlbmd0aCB3
aGVuDQo+ID4+PiArcmVwb3J0aW5nDQo+ID4+IGRpcnR5IHBhZ2VzLg0KPiA+Pj4gKw0KPiA+Pj4g
K1RvIHByZXZlbnQgYSByZWFkLW1vZGlmeS13cml0ZSBwcm9jZWR1cmUsIGlmIGEgbWVtb3J5IHBh
Z2UgaXMNCj4gPj4+ICtkaXJ0eSwNCj4gPiBJdCBpcyBub3QgdG8gcHJldmVudDsgaXQgaXMganVz
dCBub3QgcG9zc2libGUgdG8gZG8gcmFjeSBSTVcuIPCfmIoNCj4gaWYgeW91IHVuZGVyc3RhbmQg
d2hhdCBpcyBhIGF0b21pYyByb3V0aW5lLCB5b3Ugd2lsbCBub3QgY2FsbCBpdCByYWN5Lg0KPiA+
IEhlbmNlIHRvIHdvcmsgYXJvdW5kIHlvdSBwcm9wb3NlIHRvIG1hcmsgYWxsIHBhZ2VzIGRpcnR5
LiBUb28gYmFkLg0KPiA+IFRoaXMganVzdCBkb2VzIG5vdCB3b3JrLg0KPiB3aHk/IGFuZCB0aGlz
IGlzIG9wdGlvbmFsLg0KQmVjYXVzZSBkZXZpY2UgY2Fubm90IHNldCBpbmRpdmlkdWFsIGJpdHMg
aW4gYXRvbWljIHdheSBmb3Igc2FtZSBieXRlIHJlYWQgYnkgdGhlIGNwdS4NCjEuIGRldmljZSBy
ZWFkIHRoZSBieXRlIHRoYXQgaGFkIGJpdCAwIGFuZCA0IHNldC4NCjIuIGNwdSBhdG9taWNhbGx5
IGNsZWFyIHRoZXNlIGJpdHMuDQozLiBkZXZpY2Ugd3JvdGUgYml0cyAwLCA0LCBhbmQgbmV3IGJp
dHMgMiBhbmQgMy4NCjQuIGNwdSBub3cgdHJhbnNmZXJyZWQgcGFnZSAwIGFuZCA0IGFnYWluLg0K
DQpPcHRpb25hbCB0aGluZyBhbHNvIG5lZWRzIHRvIHdvcmsuIDopDQoNCj4gPg0KPiA+IFNlY29u
ZGx5IHRoZSBiaXRtYXAgYXJyYXkgaXMgZnVuY3Rpb24gaXMgZm9yIGZ1bGwgZ3Vlc3QgbWVtb3J5
IHNpemUsIHdoaWxlDQo+IHRoZXJlIGlzIGxvdCBvZiBzcGFyY2UgcmVnaW9uIG5vdyBhbmQgYWxz
byBpbiBmdXR1cmUuDQo+ID4gVGhpcyBpcyB0aGUgc2Vjb25kIHByb2JsZW0uDQo+IGRpZCB5b3Ug
c2VlIGdyYV9wb3dlciBhbmQgaXRzIGNvbW1lbnRzPw0KZ3JhX3Bvd2VyIHNheXMgdGhlIHBhZ2Ug
c2l6ZS4NCk5vdCB0aGUgc3BhcmNlIG11bHRpcGxlIHJhbmdlcyBvZiB0aGUgZ3Vlc3QgbWVtb3J5
Lg0KRGV2aWNlIGVuZHVwIHRyYWNraW5nIHVuaW50ZXJlc3RlZCBhcmVhIGFzIHdlbGwuDQoNCj4g
Pg0KPiA+IFRoaXMgaXMgZXhhY3RseSB3aHkgSSBhc2tlZCB5b3UgdG8gcmV2aWV3IHRoZSBwYWdl
IHdyaXRlIHJlY29yZGluZyBzZXJpZXMgb2YNCj4gYWRtaW4gY29tbWFuZHMgYW5kIGNvbW1lbnQu
DQo+ID4gQW5kIHlvdSBuZXZlciBjb21tZW50ZWQgd2l0aCBzaGVlciBpZ25vcmFuY2UuDQo+ID4N
Cj4gPiBTbyBjbGVhcmx5IHRoZSBzdGFydCBzdG9wIG1ldGhvZCBmb3Igc3BlY2lmaWMgcmFuZ2Ug
YW5kIHdpdGhvdXQgYmFuZHdpZHRoDQo+IGV4cGxvc2lvbiwgYWRtaW4gY29tbWFuZHMgb2YgWzFd
IHN0YW5kcyBiZXR0ZXIuDQo+ID4NCj4gPiBJZiB5b3UgZG8gWzFdIG9uIHRoZSBtZW1iZXIgZGV2
aWNlIGFsc28gdXNpbmcgaXRzIEFRIGluIGZ1dHVyZSwgaXQgd2lsbCB3b3JrIGZvcg0KPiBub24t
cGFzc3Rocm91Z2ggY2FzZS4NCj4gPiBJZiB5b3UgYnVpbGQgbm9uLXBhc3N0aHJvdWdoIGxpdmUg
bWlncmF0aW9uIHVzaW5nIFsxXSwgYWxzbyBpdCB3aWxsIHdvcmsuDQo+ID4gU28gSSBkb27igJl0
IHNlZSBhbnkgcG9pbnQgb2YgdGhpcyBzZXJpZXMgYW55bW9yZS4NCj4gQXMgSmFzb24gcG9pbnRl
ZCBvdXQsIHRoZXJlIGFyZSBtYW55IHByb2JsZW1zIGluIHlvdXIgcHJvcG9zYWwsIHlvdSBzaG91
bGQNCj4gYW5zd2VyIHRoZXJlLiBJIGRvbid0IG5lZWQgdG8gcmVwZWF0IGhpcyB3b3JkcyBhbmQg
ZHVwbGljYXRlIHRoZSBkaXNjdXNzaW9ucy4NCk1hbnkgYXJlIGFscmVhZHkgYWRkcmVzc2VkIGlu
IHYzLg0KDQo+ID4NCj4gPiBbMV0NCj4gPiBodHRwczovL2xpc3RzLm9hc2lzLW9wZW4ub3JnL2Fy
Y2hpdmVzL3ZpcnRpby1jb21tZW50LzIwMjMxMC9tc2cwMDQ3NS5oDQo+ID4gdG1sDQo+IHlvdSBz
dGlsbCBuZWVkIHRvIGV4cGxhaW4gd2h5IHRoaXMgZG9lcyBub3Qgd29yayBmb3IgcGFzcy10aHJv
dWdoLiANCkl0IGRvZXMgbm90IHdvcmsgZm9yIGZvbGxvd2luZyByZWFzb25zLg0KMS4gQmVjYXVz
ZSBhbGwgdGhlIGZpZWxkcyB0aGF0IHB1dCBvbiB0aGUgbWVtYmVyIGRldmljZSBhcmUgbm90IGlu
IGRpcmVjdCBjb250cm9sIG9mIHRoZSBoeXBlcnZpc29yLg0KVGhlIGRldmljZSBpcyBkaXJlY3Rs
eSBjb250cm9sbGVkIGJ5IHRoZSBndWVzdCBpbmNsdWRpbmcgdGhlIGRldmljZSBzdGF0dXMgYW5k
IHdoZW4gaXQgcmVzZXRzIHRoZSBkZXZpY2UgYWxsIHRoZSB0aGluZ3Mgc3RvcmVkIGluIHRoZSBk
ZXZpY2UgYXJlIGxvc3QuDQoNCjIuIHRoZSBQQ0kgRkxSIGlzIGNsZWFyaW5nIGFsbCB0aGUgcmVn
aXN0ZXJzIHlvdSBleHBvc2VkIGhlcmUuDQoNCjMuIEVuZGxlc3MgZXhwYW5zaW9uIG9mIGNvbmZp
ZyByZWdpc3RlcnMgb2YgZGlydHkgdHJhY2tpbmcgaXMgbm90IHNjYWxhYmxlLCBhcyB0aGV5IGFy
ZSBub3QgaW5pdCB0aW1lIHJlZ2lzdGVycyBub3QgZm9sbG93aW5nIHRoZSBBcHBlbmRpeCBCIGd1
aWRlbGluZXMuDQoNCjQuIGJpdG1hcCBiYXNlZCBkaXJ0eSB0cmFja2luZyBpcyBub3QgYXRvbWlj
IGJldHdlZW4gY3B1IGFuZCBkZXZpY2UuDQpIZW5jZSwgaXQgaXMgcmFjeS4NCg0KNS4gQWxsIHRo
ZSBkZXZpY2UgY29udGV4dCBuZWVkZWQgZm9yIHBhc3N0aHJvdWdoIGJhc2VkIGh5cGVydmlzb3Ig
Zm9yIGEgZGV2aWNlIHR5cGUgc3BlY2lmaWMgaXMgbWlzc2luZy4NCkFsbCBvZiB0aG9zZSBjYW4g
YmUgdXNlZCBmb3Igbm9uLXBhc3N0aHJvdWdoIGFzIHdlbGwuDQpbMV0gaHR0cHM6Ly9saXN0cy5v
YXNpcy1vcGVuLm9yZy9hcmNoaXZlcy92aXJ0aW8tY29tbWVudC8yMDIzMTEvbXNnMDAwODUuaHRt
bA0KDQo+IEFuZCBJDQo+IHJlbWVtYmVyIHRoaXMgaXMgYSBwb2ludC1sZXNzIHRvcGljIGFzIE1T
VCBldmVyIHdhbnRzIHRvIG11dGUgYW5vdGhlciAicGFzcy0NCj4gdGhyb3VnaCIgdGhyZWFkLg0K
Tm8uIGhlIGRpZCBub3Qgc2F5IHRoYXQuDQpIZSBtZWFudCB0byBub3QgZW5kbGVzc2x5IGRlYmF0
ZSB3aGljaCBvbmUgaXMgYmV0dGVyLg0KSGUgY2xlYXJseSBzYWlkLCB0cnkgdG8gc2VlIGlmIHlv
dSBjYW4gbWFrZSBtdWx0aXBsZSBoeXBlcnZpc29yIG1vZGVsIHdvcmsuDQpBbmQgeW91ciBzZXJp
ZXMgc2hvd3MgYSBjbGVhciBpZ25vcmFuY2Ugb2YgaGlzIGd1aWRhbmNlLg0KDQoNCj4gPg0KPiA+
Pj4gK29wdGlvbmFsbHkgdGhlIGRldmljZSBpcyBwZXJtaXR0ZWQgdG8gc2V0IHRoZSBlbnRpcmUg
Ynl0ZSwgd2hpY2gNCj4gPj4+ICtlbmNvbXBhc3Nlcw0KPiA+PiB0aGUgcmVsZXZhbnQgYml0LCB0
byAxLg0KPiA+Pj4gKw0KPiA+Pj4gK1RoZSBkZXZpY2UgTUFZIGluY3JlYXNlIFxmaWVsZHtncmFf
cG93ZXJ9IHRvIHJlZHVjZQ0KPiBcZmllbGR7Yml0bWFwX2xlbmd0aH0uDQo+ID4+PiArDQo+ID4+
PiArVGhlIGRldmljZSBtdXN0IGlnbm9yZSBhbnkgd3JpdGVzIHRvIFxmaWVsZHtwYXNpZH0gaWYg
UEFTSUQNCj4gPj4+ICtFeHRlbmRlZCBDYXBhYmlsaXR5IGlzIGFic2VudCBvciB0aGUgUEFTSUQg
ZnVuY3Rpb25hbGl0eSBpcw0KPiA+Pj4gK2Rpc2FibGVkIGluIFBBU0lEIEV4dGVuZGVkIENhcGFi
aWxpdHkNCj4gPj4NCj4gPj4gSSBoYXZlIHRvIHNheSB0aGlzIGlzIGdvaW5nIHRvIHdvcmsgdmVy
eSBiYWRseSB3aGVuIHRoZSBudW1iZXIgb2YNCj4gPj4gZGlydHkgcGFnZXMgaXMNCj4gPj4gc21h
bGw6IHlvdSB3aWxsIGVuZCB1cCBzY2FubmluZyBhbmQgcmUtc2Nhbm5pbmcgYWxsIG9mIGJpdG1h
cC4NCj4gPj4gQW5kIHRoZSByZXNvbHV0aW9uIGlzIGFwcGFyZW50bHkgOCBwYWdlcz8gWW91IGhh
dmUganVzdCBtdWx0aXBsaWVkDQo+ID4+IHRoZSBtaWdyYXRpb24gYmFuZHdpZHRoIGJ5IGEgZmFj
dG9yIG9mIDguDQo+ID4gWWVhaC4NCj4gPiBBbmQgZGV2aWNlIGRvZXMgbm90IGV2ZW4ga25vdyBw
cmV2aW91c2x5IHJlcG9ydGVkIHBhZ2VzIGFyZSByZWFkIGJ5IGRyaXZlcg0KPiBvciBub3QuIEFs
bCBndWVzcyB3b3JrIGdhbWUgZm9yIGRyaXZlciBhbmQgZGV2aWNlLg0KPiBzZWUgbXkgcmVwbHkg
dG8gaGltDQpQbGVhc2Ugc2VlIGFib3ZlIHJlcGx5Lg0K


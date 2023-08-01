Return-Path: <virtio-comment-return-6936-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA80FC001DF
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 00:25:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 257351CA246
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 00:25:34 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0ED4398648B
	for <virtio-comment@archiver.kernel.org>; Tue,  1 Aug 2023 00:25:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id EBC17983EFA; Tue,  1 Aug 2023 00:25:33 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D751498639B
	for <virtio-comment@lists.oasis-open.org>; Tue,  1 Aug 2023 00:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cgh7uSFK9LO1MmErlNHYNb4Xjhc7Rrpm0XklxO2GMy/k4UHVgH6KbcNJwTZAt5A9WBoLs5qJY1mK3spoDQqBeev+UwYokICJYBNP6qe4kwbJHR7sLSzBTD+1Gq9O5kDF6DcG/a8WpIzIH5Nj3rBpq6PxeHUcaGhr82cYTOLm9xNZgO6WyVQhK9XOZ6vVVA2X1TPw8gwy7EhZHm+fvTFaqMjrrg9RSnOhEL1Awy3+XcZrtrgT3qfWLKJdFrwJjQ4pWfrYcbr3tVNqM2i1qU5TcqLovN2FF0mvfzvBK3c5pgyiHnqXBsapQdARvH3rgjhi4mdT5G4UCXONyIr1AVUjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VcY4p/AoPfGH8WPatmKligNHPiwzORGYQHZKLqGnOpY=;
 b=Dc2Zqc8tY2kxtXLHeQTw7IN9CGqxdYK5UNQpfe7lhXioFXNJ5+XzzdqAqDPGBU+u10IFlyGqZH7HGN04KQlG2HZN165Vo07FkJk1sViGrzDIPePncBowCCE9Yc55S6DvZm7qN/7pzuCL0eyASVDGkaIYTLvmF6CLkb/Xvy+qP1gLqgJiNVawTlb+k2MldZ+ZdVAHgK4Civ0eNuay/RgcOvTUUAuzsK8bKZOYUGiWmF4BEJeeyKD4pfrp0vDDl4hjrtPzaFR3CSY4n8tF2riCZPxMtYNK2wOpSmvDn93h0thf3KFFtlkT3ykF8l0+2IvIO6kvuxKmgFvmAniNDohaQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: zhenwei pi <pizhenwei@bytedance.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>,
        "parav@nvidia.com"
	<parav@nvidia.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang
	<jasowang@redhat.com>,
        "virtio-comment@lists.oasis-open.org"
	<virtio-comment@lists.oasis-open.org>,
        "houp@yusur.tech" <houp@yusur.tech>,
        "zhouhuaping.san@bytedance.com" <zhouhuaping.san@bytedance.com>,
        "xinhao.kong@duke.edu" <xinhao.kong@duke.edu>
Thread-Topic: [virtio-comment] [PATCH v4 4/7] transport-fabrics: introduce
 command set
Thread-Index: AQHZxA6cJ89zw/3BLkmrW3mqTvFVSw==
Date: Tue, 1 Aug 2023 00:25:01 +0000
Message-ID: <1C01DF14-E01F-454B-B9DE-590D37ADD3A6@nutanix.com>
References: <20230626072551.1709389-1-pizhenwei@bytedance.com>
 <20230626072551.1709389-5-pizhenwei@bytedance.com>
 <F0CEEC0A-4087-4BAF-B0AB-E56EF078457D@nutanix.com>
 <be483647-00db-7529-0632-60ace98efd72@bytedance.com>
In-Reply-To: <be483647-00db-7529-0632-60ace98efd72@bytedance.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|CH0PR02MB8108:EE_
x-ms-office365-filtering-correlation-id: f2467c7e-b81f-44a1-5d4b-08db9225bee4
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vxYePTXP5wgBpvVa8aLwosSCZMIMLWYfj/Ptd5uqbAWk/bMAiPqJGzNvxShpNjKZvzwn95f9Tba9+rGRy6DSyNedIHt78Kt5T0OXtyOq0w2OSPrEbMmw/B9d0RTzbqi+qVeGQ7boW5w9XCEfWNzAdQKR8v6kkRfzyPC6tnE2KogcIdBm6m8XkrEOyVtBTI2tZiXidkX44Ahk9P1tzer4WDQPXqiCptMXp1GOQhs4I2BayLP7bmaKLxtwwGAakV9H9Uqunkr8T8zqCfjsa/KuJHYsGnnHz3bHPb7PzDwRDlPbQyJN+CSBDszkGQ7nYh8Yv+KC5tR37LYX6Yo760c1QdXbfIzKcH9UjfuilFvmBNXyhFEoPGayz398STJz8/RhadpNeV1cH04fKTwPnxAm2XLeQ7YvpugHg1jo21IrF+OFq2NGGnGCR+SuNHakFPpy4CVY0k1KjRy9gsHsRyHIOBKb7hqnRmMTgedL3oRzZ4Ypqeg2G+OYd7QXHsxaJq7nQoeU6XKEf0wpapFRX6ODr9iyL5n2IcA8XUdt8J1PmLYcTKPHgFSK8dLzyYbys5IxA0oukHCIfNlZTgSWXO7NTCm2xC7oUGSyRgjDPw5Q2w1wMKOpSdLuM1lBd2iYof0v/HIeVN3OgfAVjSOHAg712g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR02MB7938.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(44832011)(6512007)(966005)(6486002)(36756003)(53546011)(2616005)(26005)(6506007)(83380400001)(186003)(33656002)(66946007)(76116006)(91956017)(66556008)(41300700001)(38100700002)(122000001)(54906003)(38070700005)(66476007)(86362001)(316002)(4326008)(5660300002)(8936002)(6916009)(8676002)(64756008)(66446008)(2906002)(71200400001)(478600001)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a1pRY04rUmRMcllGT0xuZGw3a09ud3pnN0NxNWhLb29aam1wWG1hU2NwWFV6?=
 =?utf-8?B?NnVIazJ0OWFFcnRIcTNRRWhNY042TE9lWWFWOURESkZXRm1jQkI1LzN3L1lK?=
 =?utf-8?B?YTJtR3lFOXpDb0xucG03WHhkbnRGaHFMZzFvMXBtVmhGcmlLTFlGZUU3T2VJ?=
 =?utf-8?B?UEZhb1RXMXIyZGpvenM3SGZheUFWSy9kQk0xclllNU93QXFsV1BLN3BHUzFa?=
 =?utf-8?B?cm1zc2JKTUh2ZkwxUlJqZ2RLZ1pkRUR2dE9IWmtWeHZNalZ4emcxeGtjQk1u?=
 =?utf-8?B?LzFLSGZjODZzTi9mNzZ4UFFOMFdmK0hZcVNtMGhVVStMSUwvZkI5UnFSN3Vz?=
 =?utf-8?B?WUx1eEw0WjdWTG1BRzU3TVlLdnJIOTJITUU0YkhVUWtpV1c4QXdTWXpCOUxO?=
 =?utf-8?B?RFVndUxrNlNIRk93M1pQWjJ5M1hBYjROdzdTYUxmVElSTGhKdVdzczJJNFMz?=
 =?utf-8?B?cExBQ3JxQUt6cUwyRUxtZTR0RWhrMy9sd3d2Nnkwem9QMUlNdmdlWVdaVXk2?=
 =?utf-8?B?S2FBbldlTEk1YS9JVk9tVVgrMlZMYVY5WGhqM1dVcTFyQzlySjRPeWZFLzB3?=
 =?utf-8?B?ZVdSREhabnBEMm80V3AvS0pvNjd1d3FSTXBwNUZKTkJTS0VGZVQzTmhJeXNx?=
 =?utf-8?B?ak93ZnFkNDNhRE5KNS9lbndLdGZvanU4RnQyZzZTU01PTDBhclNONnU3b0c4?=
 =?utf-8?B?U0FaV3QzTTk2TmM2dHp2MGNkVVpXR0NXcy9jTFVYdnZVT25aRjMrdUVQNXpK?=
 =?utf-8?B?N01jQ3RvYnZrM1ppZjk0cEhDNlBFQUU5ekhPZXlFK0Z1ZzUvUHdGc0p2UE5I?=
 =?utf-8?B?empqaDE1TDQwdGVYVW9rWjZQNHppWmg4MDhucHdFL2VIYktOOEUxdjZYbzUy?=
 =?utf-8?B?Rm8xWTBQR1o0ZU5qZm9qemNYSXRpemF5M21iWmZDc0hEK3BxakdBdHBDRXNv?=
 =?utf-8?B?LzV6eVBGSzdHRVdnTjhXTG9PR3lCWWUrcFhReVNXanVSYm05ZUl1NGZkbDVX?=
 =?utf-8?B?cW5TeG5hK0tlYytpVlRzYmlmL1R2R05xZDhWYXpjeDc0SUJjbFlEcWZDV3VL?=
 =?utf-8?B?N01ha1J2bmMwUFYrRE5YNm9hSit6YWpmeVN4NGNHSm1wOEVRLy9GR21jU1Fp?=
 =?utf-8?B?RGFFRDZ6R0N1b3VVRU5zSTFscWgvNnAyYTl4MEN4YnVHZFp3ZFhqVXA3MUNX?=
 =?utf-8?B?UUNESllOTmIxZjRxOUlPUU1jRE9reEc3VGNoV1Jqd0huckZJTzZuVUVWaDNC?=
 =?utf-8?B?WUlLVWVnbzcwUVZRMEZhVzFvQ0h3NWpWT0x0dlcrSkNQRWxabUtERXBjaXlM?=
 =?utf-8?B?S2RtVSs3dnVPdHVQWFRwaThGN1B5elMrNTI0SFJQbFo3MW5Ba1djdkdzMUg3?=
 =?utf-8?B?aWFUR3hSUXVPSG1xVE8vdUNEdW1BMW8vaTg5bVJzZWQwUUo0dTROYnpYd3lZ?=
 =?utf-8?B?WTRGeHFwNU1VVWNzYkIzdTU5SUhZWWlXSDhHazJBOTJwSnpZTjFsU213TExN?=
 =?utf-8?B?RUg2OFJDZ0JHTm1MdXlndjBKL2ZXc3AzOXVHVmM2NERaME1veWtoOExEU3JW?=
 =?utf-8?B?OFdVVXEwN3grY3VPUkwyMTI4azhvSXdZc0pDV0lIVlUySEIzNUl4WHpFeDRU?=
 =?utf-8?B?OU9YU3FpWUpsNDIyYXl1UTRFc25namVrZXlpdEI5anV3cUNVRmVyZVk1aUVK?=
 =?utf-8?B?dmYwQ1NNVzdiTm5WdHg2ZWI1M2gxeWZFbVUwTGNod0lSVkUrTmRlQnhDRG9N?=
 =?utf-8?B?aFRpaGFhYlJISTIvVlFBMlFVSnVPa0JKVU5tYXBIL0k4R0hMRllqUEplbHUy?=
 =?utf-8?B?NlJtT244VTlSY2Zpa2RaRnFiVnZqUkgvT2ZHWmEvSjdmQWJkN3RFaC9TcnpM?=
 =?utf-8?B?OHIzRDVsMm9EMFIybVpuaFZhTmlycDRyQzF5Mk9GK3JIMWlPeTlFMjdWZ3NV?=
 =?utf-8?B?anZwSU00VWxaZ2tSY3BpOCsyNWlWcU1EaktDQ3MzbjY1L1dRbUFKUG9ERFlw?=
 =?utf-8?B?WEdZRFd3MmJlN2VSeUQ5U1hLejVRQTJtM00zVGY5RS9BM3VjQWcwTEhwYy9P?=
 =?utf-8?B?cFZIeEFoK3BNMDREMjNMTjU5TTRjRjFKbXZqa2NiVzdybCtqaWlUSUU1bk1X?=
 =?utf-8?B?RGpkNWdPVzhtNldYdktIRDhMWDJYcU5YSmwxOFJ3eTVob0RBclh1alFpR3d6?=
 =?utf-8?B?MGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <195CACBEE0D0334294E5BB7E305F80CC@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2467c7e-b81f-44a1-5d4b-08db9225bee4
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2023 00:25:01.6724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: imT++LLaJbenWpIrfX6sRqubJJuhc6k2MeeX6ct6BNFZdIyAyvreV9MFwxqTmfjOrFwC/+OXu0hVp8lwIB4SNRyhwV08FdWdMTiZlRpkiqA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8108
X-Proofpoint-GUID: 8j1brlIxAE5D2nMUD-C56a5mbBWm6o4y
X-Proofpoint-ORIG-GUID: 8j1brlIxAE5D2nMUD-C56a5mbBWm6o4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_17,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Reason: safe
Subject: Re: [virtio-comment] [PATCH v4 4/7] transport-fabrics: introduce
 command set

DQoNCj4gT24gSnVsIDMwLCAyMDIzLCBhdCAxMDozNCBQTSwgemhlbndlaSBwaSA8cGl6aGVud2Vp
QGJ5dGVkYW5jZS5jb20+IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBPbiA3LzMwLzIzIDA3OjI4LCBS
YXBoYWVsIE5vcndpdHogd3JvdGU6DQo+PiBBcyBub3RlZCBpbiBteSBoaWdoIGxldmVsIGZlZWRi
YWNrIEkgdGhpbmsgdGhlIHByb3RvY29sIHNob3VsZCBoYXZlIHJlZGlyZWN0aW9uIHNlbWFudGlj
cy4NCj4gW3NuaXBdDQo+Pj4gK1xlbmR7bHN0bGlzdGluZ30NCj4+PiArDQo+Pj4gK1xwYXJhZ3Jh
cGh7Q29ubmVjdCBDb21tYW5kfVxsYWJlbHtzZWM6VmlydGlvIFRyYW5zcG9ydCBPcHRpb25zIC8g
VmlydGlvIE92ZXIgRmFicmljcyAvIENvbW1hbmRzIERlZmluaXRpb24gLyBPcGNvZGVzIC8gQ29u
bmVjdCBDb21tYW5kfQ0KPj4+ICsNCj4+IFRoaXMgd291bGQgYmUgYSBnb29kIHBsYWNlIHRvIGlu
dHJvZHVjZSBzb21lIGtpbmQgb2YgdGFyZ2V0LXNpZGUgcmVkaXJlY3QgbWVjaGFuaXNtIHRvIHN1
cHBvcnQgcmVkaXJlY3RpbmcgdG8gYW5vdGhlciBJUC4NCj4+IFByb2JhYmx5IGp1c3QgYW5vdGhl
ciBvcC9zdGF0dXMgY29kZSBhbmQgbWVzc2FnZSBmcm9tIHRoZSB0YXJnZXQgZm9yIHJlZGlyZWN0
aW9uPw0KPiANCj4gUmVkaXJlY3QgbWVjaGFuaXNtIGlzIG5vdCB1c2VkIHdpZGVseSBpbiBteSBw
cmFjdGljZS4gSW5zdGVhZCwgbXVsdGkgcGF0aCBtZWNoYW5pc20gaXMgdXNlZCBhIGxvdC4gV291
bGQgeW91IHBsZWFzZSBzaGFyZSB5b3VyIGV4cGVyaWVuY2Ugb24gdGhpcz8NCj4gDQoNCkFncmVl
ZCAtIG11bHRpcGF0aCBpcyBtb3JlIGNvbW1vbiBpbiBpU0NTSSBpbXBsZW1lbnRhdGlvbnMuIEhv
dyB3b3VsZCB5b3UgbWFrZSBtdWx0aXBhdGggd29yayBmb3IgVmlydGlvLW8tRiBzaW5jZSB5b3Ug
b25seSBoYXZlIG9uZSBUQ1Agb3IgUkRNQSBjb25uZWN0aW9uIHBlciBWUT8NCg0KV2hhdCBjb25j
ZXJuIGRvIHlvdSBoYXZlIHdpdGggcmVkaXJlY3Rpb24tYmFzZWQgaVNDU0kgaW1wbGVtZW50YXRp
b25zPyBJdOKAmXMgY29uY2VwdHVhbGx5IHF1aXRlIHRyaXZpYWwuIFdlIGhhdmUgcHVibGlzaGVk
IGRvY3VtZW50YXRpb24gb24gb3VyIGltcGxlbWVudGF0aW9uIGhlcmU6IGh0dHBzOi8vd3d3Lm51
dGFuaXhiaWJsZS5jb20vNWItYm9vay1vZi1haHYtaG93LWl0LXdvcmtzLmh0bWwgLg0KDQpJIGlt
YWdpbmUgVmlydGlvLW9GIGltcGxlbWVudGF0aW9ucyBjb3VsZCBkbyBzb21ldGhpbmcgc2ltaWxh
ciB0byBhdm9pZCByZWxpYW5jZSBvbiBhIGZpeGVkIElQLiANCg0KPiAtLSANCj4gemhlbndlaSBw
aQ0KDQo=

